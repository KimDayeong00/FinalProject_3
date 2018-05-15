package com.jhta.project.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;

public class ImageRecognition {

	/*
	 * private String modelpath; private String imagepath;
	 */

	public String images(byte[] bytes) throws UnsupportedEncodingException  {
		String result = "";
		File file = new File("C:\\Users\\Lee\\Desktop\\파이널프로젝트\\FinalProject_3\\src\\main\\webapp\\resources\\inception_dec_2015");
		String modelpath = file.getAbsolutePath();
		System.out.println("Opening: " + file.getAbsolutePath());
		boolean modelselected = true;
		byte[] graphDef = readAllBytesOrExit(Paths.get(modelpath, "tensorflow_inception_graph.pb"));
		List<String> labels = readAllLinesOrExit(Paths.get(modelpath, "imagenet_comp_graph_label_strings.txt"));

		/*try {*/
		 /*File file2 = new File("C:\\Users\\YoonSoo\\Desktop\\dog\\dog1.jpg");*/
         String imagepath = file.getAbsolutePath();
         System.out.println("Image Path: " + imagepath);
      /*   Image img = ImageIO.read(file2);*/
	/*	} catch (IOException e) {
			e.printStackTrace();
		}*/
	
		
		/* byte[] imageBytes = readAllBytesOrExit(Paths.get(file2));*/
         byte[] imageBytes = bytes;
         try (Tensor image = Tensor.create(imageBytes)) {
             float[] labelProbabilities = executeInceptionGraph(graphDef, image);
             int bestLabelIdx = maxIndex(labelProbabilities);
             Dogs dog = new Dogs();
             String dogName = dog.dogC(labels.get(bestLabelIdx));
             System.out.println(dogName);
           
             
             System.out.println(
                     String.format(
                             "BEST MATCH: %s (%.2f%%)",
                             dogName, labelProbabilities[bestLabelIdx] * 100f));
             
             result = String.format(
                     "%s (%.2f%%)",
                     dogName, labelProbabilities[bestLabelIdx] * 100f);
         }
     //  result= URLEncoder.encode(result,"utf-8");
		
		return result;
		
		
	}

	
	
	
	
	
	private static byte[] readAllBytesOrExit(Path path) {
		try {
			return Files.readAllBytes(path);
		} catch (IOException e) {
			System.err.println("Failed to read [" + path + "]: " + e.getMessage());
			System.exit(1);
		}
		return null;
	}

	
	
	
	
	
	private static List<String> readAllLinesOrExit(Path path) {
		try {
			return Files.readAllLines(path, Charset.forName("UTF-8"));
		} catch (IOException e) {
			System.err.println("Failed to read [" + path + "]: " + e.getMessage());
			System.exit(0);
		}
		return null;
	}

	
	
	private static float[] executeInceptionGraph(byte[] graphDef, Tensor image) {
        try (Graph g = new Graph()) {
            g.importGraphDef(graphDef);
            try (Session s = new Session(g);
                    Tensor result = s.runner().feed("DecodeJpeg/contents", image).fetch("softmax").run().get(0)) {
                final long[] rshape = result.shape();
                if (result.numDimensions() != 2 || rshape[0] != 1) {
                    throw new RuntimeException(
                            String.format(
                                    "Expected model to produce a [1 N] shaped tensor where N is the number of labels, instead it produced one with shape %s",
                                    Arrays.toString(rshape)));
                }
                int nlabels = (int) rshape[1];
                return result.copyTo(new float[1][nlabels])[0];
            }
        }
    }
	
	
	 private static int maxIndex(float[] probabilities) {
	        int best = 0;
	        for (int i = 1; i < probabilities.length; ++i) {
	            if (probabilities[i] > probabilities[best]) {
	                best = i;
	            }
	        }
	        return best;
	    }
	
}
