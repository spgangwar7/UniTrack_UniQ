package com.digi.unitouch.scholarOne.Meta;

import java.util.List;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

@XStreamAlias("editor_list")
public class EditorList {

	
	@XStreamAlias("editor")
	@XStreamImplicit
	private List<Editor> editor;

	@Override
	public String toString() {
		return "EditorList [editor=" + editor + "]";
	}
	
	
}
