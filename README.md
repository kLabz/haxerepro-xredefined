# Repro for "X is redefined from X" error

To install dependencies:

```sh
haxelib newrepo
haxelib install --always install.hxml
```

Also install [haxerepro tools](https://github.com/kLabz/haxerepro) to replay these recordings.

## 1st repro - Get initial issue leading to x redefined

```
node /path/to/haxerepro/bin/replay.js --path recording --file repro.log
```

Expected output:

```
> cache build
> Display request server/invalidate
> Display request display/completion
> Display request display/completion
> compilation
=> Error:
tests/partials/TestImperativeAst.hx:30: characters 18-46 : [2] Instance constructor not found: hxser.gen.CodeBuilder
Done.
```

## 2nd repro - Get x redefined error

```
node /path/to/haxerepro/bin/replay.js --path recording --file repro-1.log
```

Expected output:

```
> cache build
> Display request server/invalidate
> Display request display/completion
> Display request display/completion
> Display request display/completion
> compilation
=> Error:
Type name hxser.gen.CodeBuilder is redefined from module hxser.gen.CodeBuilder
Done.
```

## 3rd repro - Broken completion

```
cd repro/xredefined
node /path/to/haxerepro/bin/replay.js --path recording --file repro-2.log
```

Expected output:

```
> cache build
> Display request server/invalidate
> Display request display/completion
> Display request display/completion
> Display request display/completion
> Display request display/completion
=> Completion request failed
Done.
```
