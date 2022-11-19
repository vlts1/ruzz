import 'package:ruzz/local_db/release.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RuzzDb {
  RuzzDb._privateConstructor();
  static final RuzzDb instance = RuzzDb._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), 'ruzz.db'),
      onCreate: ((db, version) {
        return db.execute("""
          CREATE TABLE subs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            technology TEXT NOT NULL,
            version TEXT NOT NULL,
            summary_link TEXT NOT NULL,
            docs_link TEXT NOT NULL,
            release_date TIMESTAMP NOT NULL
          )
          """);
      }),
      version: 1,
    );

    return _database!;
  }

  List<Release> _queryToReleases(List<Map<String, Object?>> maps) {
    List<Release> releases = [];
    for (Map map in maps) {
      releases.add(Release.fromRuzzDb(map));
    }
    return releases;
  }

  Future<List<Release>> latestReleases() async {
    final db = await instance.database;
    List<Map<String, Object?>> releases = await db.rawQuery(
      '''
      SELECT * FROM subs
      ORDER BY release_date DESC
      LIMIT 100
      ''',
    );
    return _queryToReleases(releases);
  }

  Future<bool> isFollowing(String technology) async {
    final db = await instance.database;
    var matches = await db.rawQuery(
      '''
      SELECT COUNT(*) FROM subs
      WHERE technology=?
      LIMIT 1
      ''',
      [technology],
    );
    return Sqflite.firstIntValue(matches) != 0;
  }

  Future<String> latestVersion(String technology) async {
    final db = await instance.database;
    List<Map<String, Object?>> latestVersion = await db.rawQuery(
      '''
      SELECT version FROM subs
      WHERE technology=?
      ORDER BY release_date DESC
      LIMIT 1
      ''',
      [technology],
    );

    return latestVersion.first['version'] as String;
  }

  Future<List<Release>> allTechnologyReleases(String technology) async {
    final db = await instance.database;
    List<Map<String, Object?>> technologyReleases = await db.rawQuery(
      '''
      SELECT * FROM subs
      WHERE technology=?
      ORDER BY release_date DESC
      ''',
      [technology],
    );
    return _queryToReleases(technologyReleases);
  }

  Future<void> addNewRelease(Release release) async {
    final db = await instance.database;

    final allReleases = await instance.allTechnologyReleases(release.technology);
    if (allReleases.contains(release)) return;

    db.insert(
      'subs',
      release.toRuzzDb(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addAllReleases(List<Release> releases) async {
    final db = await instance.database;

    for (Release release in releases) {
      await db.insert(
        'subs',
        release.toRuzzDb(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> removeAllReleases(List<String> technologies) async {
    final db = await instance.database;
    //* SQFLite doesn't support the where in clause. See
    //* https://stackoverflow.com/questions/67732147/where-in-clause-in-flutter-sqflite
    await db.delete(
      'subs',
      where: 'technology IN (${List.filled(technologies.length, '?').join(',')})',
      whereArgs: technologies,
    );
  }

  Future<Map<String, String>> latestReleaseDatesOfSubscriptions() async {
    final db = await instance.database;
    List<Map<String, Object?>> latest = await db.rawQuery(
      '''
      SELECT DISTINCT s.release_date, s.technology
      FROM subs AS s
      WHERE s.release_date = (
        SELECT MAX(s2.release_date)
        FROM subs AS s2
        WHERE s2.technology = s.technology
      )
      ''',
    );
    final Map<String, String> technologyToLatestReleaseDate = {};
    for (Map map in latest) {
      technologyToLatestReleaseDate[map['technology']] = map['release_date'];
    }
    return technologyToLatestReleaseDate;
  }

  Future<Map<String, String>> latestReleaseVersionsOfSubscriptions() async {
    final db = await instance.database;
    List<Map<String, Object?>> latest = await db.rawQuery(
      '''
      SELECT DISTINCT s.version, s.technology
      FROM subs AS s
      WHERE s.release_date = (
        SELECT MAX(s2.release_date) 
        FROM subs AS s2 
        WHERE s2.technology = s.technology
      )
      ''',
    );
    final Map<String, String> technologyToLatestVersion = {};
    for (Map map in latest) {
      technologyToLatestVersion[map['technology']] = map['version'];
    }
    return technologyToLatestVersion;
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
