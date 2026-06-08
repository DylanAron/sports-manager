import request from '@/utils/request'

// 获取表格数据
export const getTableData = (params) => {
	return request({
		url: '/business/scheme/selectByPage',
		method: "post",
		data: params
	})
}

// 添加方案
export const addScheme = (data) => {
	return request({
		url: '/business/scheme/add',
		method: "post",
		data: data
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





// 修改专家
export const update = (data) => {
	return request({
		url: '/business/scheme/edit',
		method: "post",
		data: data
	})
}