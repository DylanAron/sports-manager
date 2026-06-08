import request from '@/utils/request'

// 获取表格数据
export const getTableData = (params) => {
	return request({
		url: '/business/expert/selectByPage',
		method: "post",
		data: params
	})
}

// 上传头像
export const uploadAvatar = (data) => {
	return request({
		url: '/business/expert/uploadAvatar',
		method: "post",
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		data: data
	})
}


// 添加专家
export const add = (data) => {
	return request({
		url: '/business/expert/add',
		method: "post",
		data: data
	})
}


// 修改专家
export const update = (data) => {
	return request({
		url: '/business/expert/edit',
		method: "post",
		data: data
	})
}