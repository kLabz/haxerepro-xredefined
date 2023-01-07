package hxser.schema;

@:structInit class SchemaItem {

    public final id:SchemaItemId = SchemaItemId.next();
    public final name:String;
    public final sourceType:Type;
    public final encodingType:EncodingType;

}

abstract SchemaItemId(Int) {

    static var id:Int = 0;

    public static inline function next():SchemaItemId return cast ++id;

    public static inline function resetIds():Void id = 0;

    @:from public static inline function fromItem(item:SchemaItem) return item.id;

}

@:using(hxser.schema.SchemaItem.EncodingTypeTools)
enum EncodingType {

    Primitive(type:EncodingPrimitive<Any>);

}

enum EncodingPrimitive<T> {

    Numeric<Float>
    (?precision:NumericPrecision);
    Integer<Int>
    (?range:IntegerRange);
    Boolean<Bool>;
    String<String>;
    Bytes<Dynamic>;

}

typedef IntegerRange = {from:Int, to:Int}

enum NumericPrecision {

    Single;

    Double;

}

class EncodingTypeTools {

    public static function getPrimitiveType(type:EncodingType):ComplexType {
        return switch type {
            case Primitive(type): switch type {
                    case Numeric(precision): macro
                    :Float;
                    case Integer(range): macro
                    :Int;
                    case Boolean: macro
                    :Bool;
                    case String: macro
                    :String;
                    case Bytes: null;
                }
            case _: throw "Unexpected: type is not a primitive.";
        }
    }

    public static function getPrimitiveEncoding(type:EncodingType):EncodingPrimitive<Dynamic> {
        return switch type {
            case Primitive(type): type;
            case _: throw "Unexpected: type is not a primitive.";
        }
    }

}
