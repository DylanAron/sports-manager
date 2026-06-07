<template>
	<!-- 修改方案 -->
	<el-dialog v-model="data.openEditDialog" title="修改方案" min-width="620" align-center
		@close="emit('update',{type: 1,reload: false})">
		<el-form :inline="true" :model="form" label-position="right">
			<el-form-item label="方案类型" required>
				<el-select v-model="form.type" disabled placeholder="选择方案类型" size="large" style="width: 240px">
					<el-option v-for="item in data.typeOptions" :key="item.value" :label="item.label"
						:value="item.value" />
				</el-select>
			</el-form-item>

			<el-form-item label="选择专家" :required="form.type==1">
				<el-select v-model="form.expertId" :disabled="form.type==0" remote reserve-keyword placeholder="选择专家"
					size="large" style="width: 240px" filterable :remote-method="doGetExpertList"
					:loading="data.loadingSearch">
					<el-option v-for="item in data.expertList" :key="item.id" :label="item.name" :value="item.id" />
				</el-select>
			</el-form-item>
			<el-form-item label="喜欢人数" required>
				<el-input type="number" v-model="form.likeNum" autocomplete="off" />
			</el-form-item>
			<el-form-item label="联赛名称" required>
				<el-input v-model="form.leagueName" autocomplete="off" />
			</el-form-item>
			<el-form-item label="比赛时间" required>
				<el-date-picker v-model="form.matchTime" type="datetime" placeholder="选择比赛时间" />
			</el-form-item>
			<el-form-item label="主队名称" required>
				<el-input v-model="form.homeName" autocomplete="off" />
			</el-form-item>

			<el-form-item label="客队名称" required>
				<el-input v-model="form.guestName" autocomplete="off" />
			</el-form-item>

			<el-form-item label="全场比分" >
				<el-input v-model="form.fullScore" autocomplete="off" />
			</el-form-item>
			<el-form-item label="玩法类型" required>
				<el-select v-model="form.playType" placeholder="选择玩法" size="large" style="width: 240px" filterable>
					<el-option v-for="item in data.playList" :key="item.value" :label="item.label"
						:value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="推荐内容" >
				<el-select v-model="form.recommendIndex" placeholder="推荐内容" size="large" style="width: 240px">
					<el-option v-for="item in getPlayList(form.playType)" :key="item.value" :label="item.label"
						:value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="是否命中" required>
				<el-select v-model="form.isHit" placeholder="是否命中" size="large" style="width: 240px">
					<el-option v-for="item in data.hitList" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>

			<el-form-item label="命中结果" v-if="form.isHit==1" >
				<el-select v-model="form.hitIndex" placeholder="命中结果">
					<el-option v-for="(resultIterm,index) in  getPlayList(form.playType)" :key="index"
						:label="resultIterm.label" :value="index" />
				</el-select>
			</el-form-item>
			<el-form-item :label="form.playType==1?'让球数&nbsp;&nbsp;&nbsp;':'总球数&nbsp;&nbsp;&nbsp;'" >
				<el-input v-model="form.ballNum" autocomplete="off" />
			</el-form-item>
			<el-form-item label="赔率集合" >
				<el-input v-model="form.oddsList" autocomplete="off" />
			</el-form-item>
			<br />

			<el-form-item label="收款码" required label-width="78" v-if="form.type==1">
				<el-upload class="file-uploader" action="#" :http-request="doFileUpload" :show-file-list="false"
					:before-upload="beforeUpload">
					<img v-if="form.payCode" :src="BASE_API+form.payCode" class="pay-code" />
					<el-icon v-else class="file-uploader-icon">
						<Plus />
					</el-icon>
				</el-upload>
			</el-form-item>
			<br />
			<el-form-item label="分析文章" required>
				<el-input v-model="form.content" style="min-width: 500px;" autosize type="textarea"
					placeholder="Please input" />
			</el-form-item>

		</el-form>

		<template #footer>
			<div class="dialog-footer">
				<el-button @click="emit('update',{type: 1,reload: false})">取消</el-button>
				<el-button type="primary" @click="doSubmit">
					确认
				</el-button>
			</div>
		</template>

	</el-dialog>


</template>

<script setup>
	import { onMounted, reactive, ref } from 'vue';
	import { Plus } from '@element-plus/icons-vue'
	import UploadProps from 'element-plus'
	import { ElMessage } from 'element-plus'
	import { getTableData } from '@/api/business/expert'
	import { addScheme, update } from "@/api/business/scheme";
	import { uploadImage } from '../../api/common';
	const BASE_API = import.meta.env.VITE_APP_BASE_API;
	const props = defineProps(['openEditDialog', 'detail'])
	const emit = defineEmits(['update'])
	const data = reactive({
		openEditDialog: props.openEditDialog,
		formLabelWidth: '140px',
		loadingSearch: false,
		typeOptions: [{
				value: 0,
				label: '免费方案',
			},
			{
				value: 1,
				label: '专家方案',
			}
		],
		expertList: [

		],
		playList: [{
				value: 0,
				label: '竞足',
			}, {
				value: 1,
				label: '让球',
			},
			{
				value: 2,
				label: '总进球',
			},
		],
		hitList: [{
				value: 0,
				label: '未命中',
			},
			{
				value: 1,
				label: '命中',
			},
		],
		competeRecommendList: [{
				value: 0,
				label: '主胜',
			},
			{
				value: 1,
				label: '平',
			}, {
				value: 2,
				label: '客胜',
			}
		],
		letRecommendList: [{
				value: 0,
				label: '主',
			},
			{
				value: 1,
				label: '客',
			}
		],
		totalRecommendList: [{
				value: 0,
				label: '大球',
			},
			{
				value: 1,
				label: '小球',
			}
		]
	})
	const getPlayList = (type) => {
		if (type == 0) {
			return data.competeRecommendList;
		}
		if (type == 1) {
			return data.letRecommendList;
		}
		if (type == 2) {
			return data.totalRecommendList;
		}
	}
	onMounted(() => {
		doGetExpertList(null)
	})

	let image = reactive("")

	const form = reactive(props.detail)



	const beforeUpload = (file) => {
		if (file.type.indexOf("image/") == -1) {
			ElMessage.error("文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。");
		} else {
			const reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = () => {
				image = reader.result;
			};
		}
	}

	//开始上传图片
	const doFileUpload = (option) => {
		const formData = new FormData();

		formData.append('file', option.file, option.file.name)

		uploadImage(formData).then(resp => {
			console.log("上传成功")
			form.payCode = resp.data
		})

	}

	//添加专家
	const doSubmit = () => {

		//参数校验
		if (form.type == 1 && form.expertId == null) {
			ElMessage.error("请选择专家");
			return;
		}

		if (form.leagueName.trim() == '') {
			ElMessage.error("请填写联赛名称");
			return;
		}

		if (form.homeName.trim() == '') {
			ElMessage.error("请填写主队名称");
			return;
		}
		if (form.guestName.trim() == '') {
			ElMessage.error("请填写客队名称");
			return;
		}
		// if (form.ballNum == null) {
		// 	ElMessage.error("玩法数量 (让球 -1)");
		// 	return;
		// }


		// if (form.oddsList.trim() == '') {
		// 	ElMessage.error("请填写指数集合");
		// 	return;
		// }
		// let oddsObj = JSON.parse(form.oddsList)

		// if (oddsObj < 2) {
		// 	ElMessage.error("至少填写两个指数");
		// 	return;
		// }

		if (form.type == 1 && (form.payCode == null || form.payCode == '')) {
			ElMessage.error("请上传收款码");
			return;
		}


		let params = form;
		update(params).then(resp => {
			ElMessage.success("修改成功!");
			emit('update', { type: 1, reload: true })
		})
	}
	const doGetExpertList = async (selectText) => {
		data.loadingSearch = true;
		try {
			let pageParams = {
				pageNum: 1,
				pageSize: 10,
				data: {
					searchText: selectText
				}
			}
			await getTableData(pageParams).then(resp => {
				let result = resp.data;
				data.expertList = result.list;
			})
		} finally {
			data.loadingSearch = false;
		}
	}
</script>


<style lang="scss" scoped>
	:global(.el-dialog) {
		min-height: 500px;
		max-height: 90%;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
	}

	:global(.el-dialog__body) {
		display: flex;
		flex-grow: 1;
		overflow: hidden;
		overflow-y: auto;
	}


	:global(.el-form-item) {
		align-items: center;
	}

	:global(.el-overlay-dialog) {
		justify-content: center;
		align-items: center;
	}

	:global(.el-dialog.is-align-center) {
		margin: 0 !important;
	}

	:global(.file-uploader .pay-code) {
		width: 178px;
		height: 178px;
		display: block;
	}

	:global(.file-uploader .el-upload) {
		border: 1px dashed var(--el-border-color);
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
		transition: var(--el-transition-duration-fast);
	}

	:global(.file-uploader .el-upload:hover) {
		border-color: var(--el-color-primary);
	}

	:global(.el-icon.file-uploader-icon) {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		text-align: center;
	}

	:global(.el-form-item) {
		width: 260px;
	}

	:global(.el-textarea__inner) {
		min-height: 180px !important;
	}
</style>