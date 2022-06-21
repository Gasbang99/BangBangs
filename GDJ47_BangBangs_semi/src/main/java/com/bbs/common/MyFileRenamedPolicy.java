package com.bbs.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamedPolicy implements FileRenamePolicy{
	@Override
	public File rename(File oriFile) {
		File newFile = null;
		do {
			//나의 리네임규칙설정
			long currentTime=System.currentTimeMillis();
			int rndNum=(int)(Math.random()*1000)+1;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			//원본파일의 확장자 가져오기
			String oriName=oriFile.getName();
			//test.png, 첫번째 프로젝트.hwp, 세미프로젝트.ppt
			String ext=oriName.substring(oriName.lastIndexOf("."));
			String newName=sdf.format(currentTime)+"_"+rndNum+ext;
			newFile=new File(oriFile.getParent(),newName);
			
		}while(!createNewFile(newFile));
		
		return newFile;
	}
	
	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile(); //생성되면 true
		}catch(IOException e) {
			return false;
		}
	}
}
