class song {
  Message? message;

  song({this.message});

  song.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ?  Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  Header? header;
  Body? body;

  Message({this.header, this.body});

  Message.fromJson(Map<String, dynamic> json) {
    header =
        json['header'] != null ?  Header.fromJson(json['header']) : null;
    body = json['body'] != null ?  Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Header {
  int? statusCode;
  double? executeTime;

  Header({this.statusCode, this.executeTime});

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['execute_time'] = executeTime;
    return data;
  }
}

class Body {
  List<TrackList>? trackList;

  Body({this.trackList});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['track_list'] != null) {
      trackList = <TrackList>[];
      json['track_list'].forEach((v) {
        trackList!.add( TrackList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trackList != null) {
      data['track_list'] = trackList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackList {
  Track? track;

  TrackList({this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    track = json['track'] != null ?  Track.fromJson(json['track']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (track != null) {
      data['track'] = track!.toJson();
    }
    return data;
  }
}

class Track {
  int? trackId;
  String? trackName;
  List<TrackNameTranslationList>? trackNameTranslationList;
  int? trackRating;
  int? commontrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichsync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  Track(
      {this.trackId,
      this.trackName,
      this.trackNameTranslationList,
      this.trackRating,
      this.commontrackId,
      this.instrumental,
      this.explicit,
      this.hasLyrics,
      this.hasSubtitles,
      this.hasRichsync,
      this.numFavourite,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.trackShareUrl,
      this.trackEditUrl,
      this.restricted,
      this.updatedTime,
      this.primaryGenres});

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    if (json['track_name_translation_list'] != null) {
      trackNameTranslationList = <TrackNameTranslationList>[];
      json['track_name_translation_list'].forEach((v) {
        trackNameTranslationList!.add(TrackNameTranslationList.fromJson(v));
      });
    }
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = json['primary_genres'] != null
        ? PrimaryGenres.fromJson(json['primary_genres'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    if (trackNameTranslationList != null) {
      data['track_name_translation_list'] =
          trackNameTranslationList!.map((v) => v.toJson()).toList();
    }
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commontrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    if (primaryGenres != null) {
      data['primary_genres'] = primaryGenres!.toJson();
    }
    return data;
  }
}

class TrackNameTranslationList {
  TrackNameTranslation? trackNameTranslation;

  TrackNameTranslationList({this.trackNameTranslation});

  TrackNameTranslationList.fromJson(Map<String, dynamic> json) {
    trackNameTranslation = json['track_name_translation'] != null
        ? TrackNameTranslation.fromJson(json['track_name_translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trackNameTranslation != null) {
      data['track_name_translation'] = trackNameTranslation!.toJson();
    }
    return data;
  }
}

class TrackNameTranslation {
  String? language;
  String? translation;

  TrackNameTranslation({this.language, this.translation});

  TrackNameTranslation.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    data['translation'] = translation;
    return data;
  }
}

class PrimaryGenres {
  List<MusicGenreList>? musicGenreList;

  PrimaryGenres({this.musicGenreList});

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    if (json['music_genre_list'] != null) {
      musicGenreList = <MusicGenreList>[];
      json['music_genre_list'].forEach((v) {
        musicGenreList!.add(MusicGenreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (musicGenreList != null) {
      data['music_genre_list'] =
          musicGenreList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenreList {
  MusicGenre? musicGenre;

  MusicGenreList({this.musicGenre});

  MusicGenreList.fromJson(Map<String, dynamic> json) {
    musicGenre = json['music_genre'] != null
        ? MusicGenre.fromJson(json['music_genre'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (musicGenre != null) {
      data['music_genre'] = musicGenre!.toJson();
    }
    return data;
  }
}

class MusicGenre {
  int? musicGenreId;
  int? musicGenreParentId;
  String? musicGenreName;
  String? musicGenreNameExtended;
  String? musicGenreVanity;

  MusicGenre(
      {this.musicGenreId,
      this.musicGenreParentId,
      this.musicGenreName,
      this.musicGenreNameExtended,
      this.musicGenreVanity});

  MusicGenre.fromJson(Map<String, dynamic> json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_id'] = musicGenreId;
    data['music_genre_parent_id'] = musicGenreParentId;
    data['music_genre_name'] = musicGenreName;
    data['music_genre_name_extended'] = musicGenreNameExtended;
    data['music_genre_vanity'] = musicGenreVanity;
    return data;
  }
}
