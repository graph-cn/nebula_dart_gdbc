part of '../nebula_dart_gdbc.dart';

mixin NgHasTag on Database {
  /// {'space': space}
  Dialect<List> get tagsOp => Dialect('');

  /// {'name': name, 'db': db}
  Dialect<Table?> get tagOp => Dialect('');

  /// create tag
  /// {"db": db, "tag": table}
  Dialect<void> get createTagOp => Dialect('');

  /// 修改表
  /// {"db": db, "origin": origin, "alter": alter}
  /// alter 表示修改后的表
  Dialect<void> get alterTagOp => Dialect('');

  /// 删除表
  /// {"db": db, "tag": table}
  Dialect<void> get dropTagOp => Dialect('');

  /// countTagData
  /// {"db": db, "tag": table}
  Dialect<int> get countTagDataOp => Dialect('');

  /// getTagData
  /// {"db": db, "tag": table, 'limit': limit, 'offset': offset}
  Dialect<ResultSet> get getTagDataOp => Dialect('');

  /// getTagDataByIds
  /// {"db": db, "tag": table, 'ids': ids}
  Dialect<ResultSet> get getTagDataByIdsOp => Dialect('');

  /// truncTag
  /// {"db": db, "tag": table}
  Dialect<void> get truncTagOp => Dialect('');
}

mixin NgHasEdge on Database {
  /// {'space': space}
  Dialect<List> get edgesOp => Dialect('');

  /// {'name': name, 'db': db}
  Dialect<Table?> get edgeOp => Dialect('');

  /// 创建边
  /// {"db": db, "edge": table}
  Dialect<void> get createEdgeOp => Dialect('');

  /// 删除边
  /// {"db": db, "edge": table}
  Dialect<void> get dropEdgeOp => Dialect('');

  /// countEdgeData
  /// {"db": db, "edge": table}
  Dialect<int> get countEdgeDataOp => Dialect('');

  /// getEdgeData
  /// {"db": db, "edge": table, 'limit': limit, 'offset': offset, 'withVertex': withVertex}
  Dialect<ResultSet> get getEdgeDataOp => Dialect('');

  /// truncEdge
  /// {"db": db, "edge": table}
  Dialect<void> get truncEdgeOp => Dialect('');
}

mixin NgHasManagement on Database {
  /// {'type': type}
  Dialect<List<Map<String, dynamic>>> get hostsOp => Dialect(
        'SHOW HOSTS {{ type }}',
        handler: (rs, [params]) {
          return rs.rows
              .map(
                (e) => params?['type'] == null
                    ? {
                        'host': e[0],
                        'port': e[1],
                        'status': e[2],
                        'leaderCount': e[3],
                        // 'leaderDistribution': e[4].toString().replaceAll(',', '\n'),
                        // 'partition': e[5].toString().replaceAll(',', '\n'),
                        'version': e[6],
                      }
                    : {
                        "host": e[0],
                        "port": e[1],
                        "status": e[2],
                        "role": e[3],
                        "gitInfo": e[4],
                        "version": e[5],
                      },
              )
              .toList();
        },
      );

  /// addHosts
  /// {'ip': ip, 'port': port}
  Dialect<void>? get addHostsOp => Dialect('');

  /// dropHosts
  /// {'ip': ip, 'port': port}
  Dialect<void>? get dropHostsOp => Dialect('');

  Dialect<List> get databasesOp => Dialect<List>(
        'SHOW SPACES',
        handler: (rs, [params]) => rs.rows.map((r) => r[0]).toList(),
      );

  Dialect<List<Map<String, dynamic>>> get sessionsOp => Dialect(
        'SHOW SESSIONS',
        handler: (rs, [params]) => rs.rows
            .map(
              (e) => {
                'id': e[0],
                'user': e[1],
                'space': e[2],
                'createTime': e[3],
                'updateTime': e[4],
                'server': e[5],
                'timeZone': e[6],
                'clientIp': e[7],
              },
            )
            .toList(),
      );

  /// {'name': name, 'schemaType': schemaType}
  Dialect<Db> get databaseOp => Dialect('');

  /// {'space': space, 'schemaType': schemaType}
  Dialect<List> get schemaOp => Dialect(
        '''USE `{{space}}`; SHOW {{schemaType}}''',
        handler: (rs, [params]) => rs.rows.map((e) => e[0]).toList(),
      );

  /// {'name': name, 'conn': conn}
  Dialect<void> get switchSpaceOp => Dialect('USE `{{ space }}`;');

  /// {'db': graphSchema}
  Dialect<void> get switchSchemaOp => Dialect('');
}

mixin NgHasDataControl on Database {
  /// insertVertex
  /// {"db": db, "record": record}
  Dialect<void> get insertVertexOp => Dialect('');

  /// updateVertex
  /// {"db": db, "record": record}
  Dialect<void> get updateVertexOp => Dialect('');

  /// deleteVertexById
  /// {"db": db, "tag": table}
  Dialect<void> get deleteVertexByIdOp => Dialect('');

  /// deleteTagById
  /// {"db": db, "tag": table}
  Dialect<void> get deleteTagByIdOp => Dialect('');

  /// insertEdge
  /// {"db": db, "record": record}
  Dialect<void> get insertEdgeOp => Dialect('');

  /// updateEdge
  /// {"db": db, "record": record}
  Dialect<void> get updateEdgeOp => Dialect('');

  /// deleteEdge
  /// {"db": db, "record": record}
  Dialect<void> get deleteEdgeOp => Dialect('');

  /// importData
  /// {"rs": rs, "table": table, "db": db, "streamHandler": streamHandler}
  Dialect<double> get importDataOp => Dialect('');

  /// getNeighbors
  /// { "db": db, "condition": condition }
  Dialect<ResultSet> get getNeighborsOp => Dialect('');

  /// countNeighbors
  /// { "db": db, "condition": condition }
  Dialect<int> get countNeighborsOp => Dialect('');
}

mixin NgHasDb on Database {
  @override
  // TODO: implement dbOp
  Dialect<Db> get dbOp => throw UnimplementedError();

  @override
  // TODO: implement clearDbOp
  Dialect<void> get clearDbOp => throw UnimplementedError();

  @override
  // TODO: implement cloneDbOp
  Dialect<void> get cloneDbOp => throw UnimplementedError();

  // FIXME 需要处理 VidType.FIXED_STRING 的判断
  @override
  Dialect<void> get createDbOp => Dialect<void>(
        '''CREATE SPACE `{{ db.name }}` (
  partition_num = {{ db.partitionNum }},
  replica_factor = {{ db.relicaFactor }},
  vid_type = {% if(db.isString) %}FIXED_STRING({{ db.vidLength }}){% else %}INT64{% endif %}
) COMMENT = "{{ db.comment }}";''',
        handler: (rs, [params]) => Future.value(null),
      );

  @override
  // TODO: implement dropDbOp
  Dialect<void> get dropDbOp => throw UnimplementedError();
}

class NgDatabase extends GraphDatabase
    with NgHasDb, NgHasTag, NgHasEdge, NgHasManagement, NgHasDataControl {
  NgDatabase(this.conn);

  @override
  Connection conn;

  @override
  Dialect<bool> get pingOp =>
      Dialect("SHOW SPACES", handler: (rs, [params]) => rs.success);

  @override
  ScriptRender get render =>
      (gql, params) => Template.parse(gql, data: params).render();

  @override
  // TODO: implement tablesOp
  Dialect<bool> get tablesOp => throw UnimplementedError();

  @override
  // TODO: implement versionSupported
  String get versionSupported => throw UnimplementedError();

  @override
  // TODO: implement createIndexOp
  Dialect<double> get createIndexOp => throw UnimplementedError();

  @override
  // TODO: implement dropIndexOp
  Dialect<double> get dropIndexOp => throw UnimplementedError();

  @override
  // TODO: implement indexesOp
  Dialect<List> get indexesOp => throw UnimplementedError();

  @override
  // TODO: implement rebuildIndexOp
  Dialect<double> get rebuildIndexOp => throw UnimplementedError();

  @override
  // TODO: implement refreshStatesOp
  Dialect get refreshStatesOp => throw UnimplementedError();
}
