// generated with ast extension for cup
// version 0.8
// 9/0/2020 16:10:51


package askov.schoolprojects.compilerconstruction.mjcompiler.ast;

public class VoidActPars extends ActPars {

    public VoidActPars () {
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }

    public void childrenAccept(Visitor visitor) {
    }

    public void traverseTopDown(Visitor visitor) {
        accept(visitor);
    }

    public void traverseBottomUp(Visitor visitor) {
        accept(visitor);
    }

    public String toString(String tab) {
        StringBuffer buffer=new StringBuffer();
        buffer.append(tab);
        buffer.append("VoidActPars(\n");

        buffer.append(tab);
        buffer.append(") [VoidActPars]");
        return buffer.toString();
    }
}
