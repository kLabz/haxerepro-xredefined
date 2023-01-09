package hxser.gen;

import hxser.DeclarativeAst.Root;

class CodeBuilder {
    var ast:Root;

    public function new(ast:Root) {
        this.ast = ast;
    }

    public function build():Dynamic {
        switch ast {
            case null:
                return null;

            case Function(data):
                return null;
        }
    }

}
