package;

import utest.Runner;
import utest.ui.Report;

class TestsMain {

    public static function main() {
        var runner = new Runner();

        runner.addCases('partials');

        Report.create(runner, NeverShowSuccessResults, AlwaysShowHeader);
        runner.run();
    }

}
