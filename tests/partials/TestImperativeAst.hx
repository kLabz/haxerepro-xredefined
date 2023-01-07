package partials;

#if macro
import hxser.gen.CodeBuilder;
import hxser.schema.SchemaItem;

using haxe.macro.ComplexTypeTools;
#end

class TestImperativeAst extends Test {

    public function testSimplest() {
        var data = buildSimplest()(10);
    }

    macro static function buildSimplest() {
        var schema:SchemaItem = {
            name: 'foo',
            sourceType: (macro:Int).toType(),
            encodingType: Primitive(Integer())
        };

        var ast = hxser.DeclarativeAst.Root.Function({
            args: [Source(schema)],
            statements: [
                Encode(Source(schema, Encoded))
            ]
        });

        var cb = new CodeBuilder(schema, ast);
        cb.build();

        return macro function(x) return x;
    }

}
