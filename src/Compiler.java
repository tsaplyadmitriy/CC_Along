import java.io.File;
import java.io.FileInputStream;

public class Compiler {

    public static void main(String[] args) {

        try {


            FileInputStream fis = new FileInputStream(new File(args[0]));

            yylex();
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    static void yylex(){

    }




}


