 package com.digi.unitouch.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public  class UnZip
{

		
//    public static void main( String[] args )
//    {
//    	UnZip unZip = new UnZip();
//    	unZip.unZipIt(INPUT_ZIP_FILE,OUTPUT_FOLDER);
//    }
    
    /**
     * Unzip it
     * @param zipFile input zip file
     * @param output zip file output folder
     */
    public static void unZipIt(String zipFile, String outputFolder){
     byte[] buffer = new byte[1024];
    	
     try{
    		
    	//create output directory is not exists
    	File folder = new File(outputFolder);
    	if(!folder.exists()){
    		folder.mkdir();
    	}
    		
    	//get the zip file content
    	ZipInputStream zis = 
    		new ZipInputStream(new FileInputStream(zipFile));
    	//get the zipped file list entry
    	ZipEntry ze = zis.getNextEntry();
    		
    	while(ze!=null){
    			
    	   String fileName = ze.getName();
           File newFile = new File(outputFolder + File.separator + fileName);
                
           System.out.println("file unzip : "+ newFile.getAbsoluteFile());
                
            //create all non exists folders
            //else you will hit FileNotFoundException for compressed folder
            new File(newFile.getParent()).mkdirs();
              
            FileOutputStream fos = new FileOutputStream(newFile);             

            int len;
            while ((len = zis.read(buffer)) > 0) {
       		fos.write(buffer, 0, len);
            }
            newFile.setExecutable(true, false);
            newFile.setReadable(true, false);
            newFile.setWritable(true, false);	
            fos.close();   
            ze = zis.getNextEntry();
    	}
    	
        zis.closeEntry();
    	zis.close();
    		
    	System.out.println("Done");
    		
    }catch(IOException ex){
       ex.printStackTrace(); 
    }
   }  
    
    public static void unZipIt(String zipFile,String Name, String outputFolder) {
		byte[] buffer = new byte[1024];
		try {

			File folder = new File(outputFolder+File.separator+Name.substring(0, Name.indexOf(".")));
			if (!folder.exists()) {
				folder.mkdir();
			}
			
			ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile));
			
			ZipEntry ze = zis.getNextEntry();
			while (ze != null) 
			{
				String fileName = ze.getName();
				File newFile = new File(outputFolder+ File.separator + Name.substring(0, Name.indexOf("."))+ File.separator + fileName);
				System.out.println("file unzip : " + newFile.getAbsoluteFile());
				new File(newFile.getParent()).mkdirs();
				FileOutputStream fos = new FileOutputStream(newFile);
				int len;
				while ((len = zis.read(buffer)) > 0)
				{
					fos.write(buffer, 0, len);
				}
				newFile.setExecutable(true, false);
				newFile.setReadable(true, false);
				newFile.setWritable(true, false);
				fos.close();
				ze = zis.getNextEntry();
			}

			zis.closeEntry();
			zis.close();

			System.out.println("Done");

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
    
    
}