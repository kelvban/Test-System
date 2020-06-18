package io.renren.modules.kill.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 秒杀结果表
 * 
 *
 */
@Data
@TableName("kill_result")
public class KillResultEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 秒杀结果id
	 */
	@TableId
	private Long id;
	/**
	 * 秒杀用户名称
	 */
	private String userName;
	/**
	 * 秒杀结果数量
	 */
	private Integer number;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Integer status;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
