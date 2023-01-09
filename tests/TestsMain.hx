#if macro
import hxser.gen.CodeBuilder;
import hxser.schema.SchemaItem;

using haxe.macro.ComplexTypeTools;
#end

class TestsMain {
	public static function main() {
		var data = buildSimplest()(10);
	}

	macro static function buildSimplest() {
		var cb = new CodeBuilder(null);
		cb.build();

		return macro function(x) return x;
	}
}
