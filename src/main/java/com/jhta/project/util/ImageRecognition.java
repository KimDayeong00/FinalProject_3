package com.jhta.project.util;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.imageio.ImageIO;

import org.tensorflow.DataType;
import org.tensorflow.Graph;
import org.tensorflow.Output;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import java.nio.file.Path;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ImageRecognition {

	/*
	 * private String modelpath; private String imagepath;
	 */

	public void images() {
		File file = new File("C:\\Users\\YoonSoo\\Desktop\\inception_dec_2015");
		String modelpath = file.getAbsolutePath();
		System.out.println("Opening: " + file.getAbsolutePath());
		boolean modelselected = true;
		byte[] graphDef = readAllBytesOrExit(Paths.get(modelpath, "tensorflow_inception_graph.pb"));
		List<String> labels = readAllLinesOrExit(Paths.get(modelpath, "imagenet_comp_graph_label_strings.txt"));

		/*try {*/
		 File file2 = new File("C:\\Users\\YoonSoo\\Desktop\\dog\\dog1.jpg");
         String imagepath = file.getAbsolutePath();
         System.out.println("Image Path: " + imagepath);
      /*   Image img = ImageIO.read(file2);*/
	/*	} catch (IOException e) {
			e.printStackTrace();
		}*/
	
		
		 byte[] imageBytes = readAllBytesOrExit(Paths.get("C:\\Users\\YoonSoo\\Desktop\\dog\\dog1.jpg"));

         try (Tensor image = Tensor.create(imageBytes)) {
             float[] labelProbabilities = executeInceptionGraph(graphDef, image);
             int bestLabelIdx = maxIndex(labelProbabilities);
             System.out.println(labels.get(bestLabelIdx));
             
             
           
             
             System.out.println(
                     String.format(
                             "BEST MATCH: %s (%.2f%% likely)",
                             labels.get(bestLabelIdx), labelProbabilities[bestLabelIdx] * 100f));
         }

		
		
		
		
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
