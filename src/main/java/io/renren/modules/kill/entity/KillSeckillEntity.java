package io.renren.modules.kill.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 秒杀测试项表
 * 
 *
 */
@Data
@TableName("kill_seckill")
public class KillSeckillEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 秒杀测试项id
	 */
	@TableId
	private Long seckillId;
	/**
	 * 秒杀测试项名称
	 */
	private String name;
	/**
	 * 秒杀测试项数量
	 */
	private Integer number;
	/**
	 * 秒杀开启时间
	 */
	private Date startTime;
	/**
	 * 秒杀结束时间
	 */
	private Date endTime;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 0隐藏　１显示
	 */
	private Integer status;
	/**
	 * 0代表未进行秒杀　１代表正在进行秒杀
	 */
	private String seckillStatus;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getSeckillId() {
		return seckillId;
	}

	public void setSeckillId(Long seckillId) {
		this.seckillId = seckillId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getSeckillStatus() {
		return seckillStatus;
	}

	public void setSeckillStatus(String seckillStatus) {
		this.seckillStatus = seckillStatus;
	}
}
