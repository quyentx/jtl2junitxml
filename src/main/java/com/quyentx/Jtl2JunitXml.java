package com.quyentx;

import java.io.FileOutputStream;
import java.io.OutputStream;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Jtl2JunitXml {
    public static void main(String[] args) throws Exception {
        try {
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Source xslStylesheet = new StreamSource(args[0]);
            Source inputFile = new StreamSource(args[1]);
            OutputStream outputFile = new FileOutputStream(args[2]);

            Transformer transform = tFactory.newTransformer(xslStylesheet);
            transform.transform(inputFile, new StreamResult(outputFile));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
