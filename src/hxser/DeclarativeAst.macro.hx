package hxser;

import haxe.PosInfos;

enum Root {

    Function(data:FunctionData);

}

@:structInit class FunctionData {

    public final name:String = null;

    public final statements:Array<Statement>;
    public final args:Array<Argument>;

}

enum Argument {

    Source(id:SchemaItemId);

}

enum Statement {

    Encode(value:Expression, ?pos:PosInfos);

}

enum Expression {

    Source(id:SchemaItemId, state:SourceState);

}

enum SourceState {

    Raw;

    Transformed;
    Encoded;

}
