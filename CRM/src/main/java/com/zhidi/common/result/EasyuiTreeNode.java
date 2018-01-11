
package com.zhidi.common.result;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 作者:ZHP createTime 创建时间:2017年10月27日 类描述：
 */
public class EasyuiTreeNode {

	private Integer id;

	private String text;

	private String state = "open";

	private Boolean checked = false;

	private Map<String, Object> attributes = new HashMap<>();

	private List<EasyuiTreeNode> children;

	public EasyuiTreeNode() {
	}

	public EasyuiTreeNode(Integer id, String text, String state, Boolean checked, Map<String, Object> attributes,
			List<EasyuiTreeNode> children) {
		this.id = id;
		this.text = text;
		this.state = state;
		this.checked = checked;
		this.attributes = attributes;
		this.children = children;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public List<EasyuiTreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<EasyuiTreeNode> children) {
		this.children = children;
	}
	
	
}
