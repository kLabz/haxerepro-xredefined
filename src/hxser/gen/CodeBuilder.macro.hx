package hxser.gen;

import hxser.DeclarativeAst.Root;

class CodeBuilder {

    var schema:SchemaItem;
    var ast:Root;

    public function new(schema:SchemaItem, ast:Root) {
        this.schema = schema;
        this.ast = ast;
    }

    public function build():Dynamic {
        switch ast {
            case Function(data):
                // Access `data.args.`, `data.args[].`, `data.args[0].` a few times, and it breaks.
                return null;
        }
    }

}
