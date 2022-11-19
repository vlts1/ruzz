import 'package:cloud_firestore/cloud_firestore.dart';

class Release {
  Release(
    this.technology,
    this.version,
    this.summaryLink,
    this.docsLink,
    this.releaseDate,
  );

  final String technology;
  final String version;
  final String summaryLink;
  final String docsLink;
  final String releaseDate;

  factory Release.fromRuzzDb(Map map) {
    return Release(
      map['technology'  ],
      map['version'     ],
      map['summary_link'],
      map['docs_link'   ],
      map['release_date'],
    );
  }

  Map<String, Object> toRuzzDb() {
    return {
      'technology'  : technology,
      'version'     : version,
      'summary_link': summaryLink,
      'docs_link'   : docsLink,
      'release_date': releaseDate,
    };
  }

  factory Release.fromFirestore(Map map) {
    final Timestamp date = map['date'];
    final DateTime dateTime = date.toDate();
    return Release(
      map['technology'    ], 
      map['version'       ], 
      map['summary_source'], 
      map['docs_source'   ], 
      '${dateTime.year}-${dateTime.month}-${dateTime.day}',
    );
  }

  @override
  String toString() {
    return toRuzzDb().toString();
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Release &&
      other.technology == technology &&
      other.version == version &&
      other.releaseDate == releaseDate;
  }

  @override
  int get hashCode => technology.hashCode ^ version.hashCode;
}
