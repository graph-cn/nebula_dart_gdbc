import 'package:liquify/liquify.dart';
import 'package:test/test.dart';

class Db {
  int partitionNum = 3;
  String name = 'test';
  int relicaFactor = 3;
  String comment = 'test_comment';

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "partitionNum": partitionNum,
      "relicaFactor": relicaFactor,
      "comment": comment,
      "isString": true,
      "vidLength": 50,
    };
  }
}

void main() {
  test('test template', () {
    var str = Template.parse(
      '''CREATE SPACE `{{ db.name }}` (
  partition_num = {{ db.partitionNum }},
  replica_factor = {{ db.relicaFactor }},
  vid_type = {% if(db.isString) %}FIXED_STRING({{ db.vidLength }}){% else %}INT64{% endif %}
) COMMENT = "{{ db.comment }}";''',
      data: {'db': Db().toJson()},
    );
    print(str.render());
  });
}
