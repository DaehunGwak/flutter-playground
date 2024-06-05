// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_like.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMovieLikeCollection on Isar {
  IsarCollection<MovieLike> get movieLikes => this.collection();
}

const MovieLikeSchema = CollectionSchema(
  name: r'MovieLike',
  id: 4151543374242890350,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _movieLikeEstimateSize,
  serialize: _movieLikeSerialize,
  deserialize: _movieLikeDeserialize,
  deserializeProp: _movieLikeDeserializeProp,
  idName: r'movieId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _movieLikeGetId,
  getLinks: _movieLikeGetLinks,
  attach: _movieLikeAttach,
  version: '3.1.0+1',
);

int _movieLikeEstimateSize(
  MovieLike object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _movieLikeSerialize(
  MovieLike object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
}

MovieLike _movieLikeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MovieLike(
    createdAt: reader.readDateTime(offsets[0]),
    movieId: id,
  );
  return object;
}

P _movieLikeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _movieLikeGetId(MovieLike object) {
  return object.movieId;
}

List<IsarLinkBase<dynamic>> _movieLikeGetLinks(MovieLike object) {
  return [];
}

void _movieLikeAttach(IsarCollection<dynamic> col, Id id, MovieLike object) {}

extension MovieLikeQueryWhereSort
    on QueryBuilder<MovieLike, MovieLike, QWhere> {
  QueryBuilder<MovieLike, MovieLike, QAfterWhere> anyMovieId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MovieLikeQueryWhere
    on QueryBuilder<MovieLike, MovieLike, QWhereClause> {
  QueryBuilder<MovieLike, MovieLike, QAfterWhereClause> movieIdEqualTo(
      Id movieId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: movieId,
        upper: movieId,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterWhereClause> movieIdNotEqualTo(
      Id movieId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: movieId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: movieId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: movieId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: movieId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterWhereClause> movieIdGreaterThan(
      Id movieId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: movieId, includeLower: include),
      );
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterWhereClause> movieIdLessThan(
      Id movieId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: movieId, includeUpper: include),
      );
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterWhereClause> movieIdBetween(
    Id lowerMovieId,
    Id upperMovieId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerMovieId,
        includeLower: includeLower,
        upper: upperMovieId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MovieLikeQueryFilter
    on QueryBuilder<MovieLike, MovieLike, QFilterCondition> {
  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> movieIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movieId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> movieIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movieId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> movieIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movieId',
        value: value,
      ));
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterFilterCondition> movieIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movieId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MovieLikeQueryObject
    on QueryBuilder<MovieLike, MovieLike, QFilterCondition> {}

extension MovieLikeQueryLinks
    on QueryBuilder<MovieLike, MovieLike, QFilterCondition> {}

extension MovieLikeQuerySortBy on QueryBuilder<MovieLike, MovieLike, QSortBy> {
  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }
}

extension MovieLikeQuerySortThenBy
    on QueryBuilder<MovieLike, MovieLike, QSortThenBy> {
  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> thenByMovieId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieId', Sort.asc);
    });
  }

  QueryBuilder<MovieLike, MovieLike, QAfterSortBy> thenByMovieIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieId', Sort.desc);
    });
  }
}

extension MovieLikeQueryWhereDistinct
    on QueryBuilder<MovieLike, MovieLike, QDistinct> {
  QueryBuilder<MovieLike, MovieLike, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }
}

extension MovieLikeQueryProperty
    on QueryBuilder<MovieLike, MovieLike, QQueryProperty> {
  QueryBuilder<MovieLike, int, QQueryOperations> movieIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movieId');
    });
  }

  QueryBuilder<MovieLike, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }
}
