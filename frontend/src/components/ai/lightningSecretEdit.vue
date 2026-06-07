<template>
	<!-- 添加闪电秘籍-->
	<el-dialog v-model="props.isOpen" :title="props.title" min-width="620" align-center
		@close="emit('update',{reload: false})" class="secret-add">
		<el-form :inline="true" :model="form" label-position="right">
			<!-- <el-form-item label="总回报率" required>
				<el-input v-model="form.rateOfReturn" autocomplete="off" placeholder="100%~200%" />
			</el-form-item> -->

			<el-form-item label="赛事日期" required>
				<div><el-date-picker v-model="form.matchDate"  type="date" placeholder="选择日期"
						value-format="YYYY-MM-DD" /></div>
			</el-form-item>
			<el-form-item label="收款码" required label-width="78" v-if="isAfter(form.matchDate,startOfToday)">
				<el-upload class="file-uploader" action="#" :http-request="doFileUpload" :show-file-list="false"
					:before-upload="beforeUpload">
					<img v-if="form.payCode" :src="BASE_API+form.payCode" class="pay-code" />
					<el-icon v-else class="file-uploader-icon">
						<Plus />
					</el-icon>
				</el-upload>
			</el-form-item>
			<el-form-item label="赛事集合" required style="display: block;" v-if="isBefore(form.matchDate,startOfToday)">
			</el-form-item>

		</el-form>
		<div class="match-body" v-if="isBefore(form.matchDate,startOfToday)">
			<div class="add">
				<el-button type="primary" :icon="Plus" @click="doAddMatch()">添加赛事</el-button>
			</div>
			<div class="content">
				<div class="detail-row" v-for="(item,index) in form.matchList">
					<div class="row-content">
						<div class="row-item">
							<el-input v-model="item.leagueName" autocomplete="off" placeholder="联赛名称" />
						</div class="row-item">
						<div class="row-item">
							<el-input v-model="item.serialize" autocomplete="off" placeholder="序列号(周一002)" />
						</div class="row-item">
						<div class="row-item">
							<el-date-picker v-model="item.matchTime" type="datetime" placeholder="赛事时间" 
							value-format="YYYY-MM-DD HH:mm:ss"
							/>
						</div>
						<div class="row-item">
							<el-select v-model="item.matchStatus" placeholder="赛事状态">
								<el-option v-for="item in data.status" :key="item.value" :label="item.label"
									:value="item.value" />
							</el-select>
						</div>
						<div class="row-item">
							<el-input v-model="item.homeName" autocomplete="off" placeholder="主队名称" />
						</div>
						<div class="row-item">
							<el-input v-model="item.guestName" autocomplete="off" placeholder="客队名称" />
						</div>
						<div class="row-item" v-if="item.matchStatus==1">
							<el-input v-model="item.halfScore" autocomplete="off" placeholder="半场比分" />
						</div>
						<div class="row-item" v-if="item.matchStatus==1">
							<el-input v-model="item.fullScore" autocomplete="off" placeholder="全场比分" />
						</div>
						<div class="row-item" v-if="item.matchStatus==1">
							<el-select v-model="item.isHit" placeholder="是否命中">
								<el-option v-for="(hitItem,index) in data.hitList" :key="hitItem.value"
									:label="hitItem.label" :value="hitItem.value" />
							</el-select>
						</div>
						<div class="row-item item-recommend">
							<el-input v-model="item.recommendContent" autocomplete="off"
								placeholder='推荐内容 多个以英文逗号分隔 如 大1.5,小2.2 ' />
						</div>
						<div class="row-item item-hit-result" v-if="item.isHit==1">
							<el-select v-model="item.hitIndex" placeholder="命中结果">
								<el-option v-for="(content,index) in  useConvertHitResult(item.recommendContent)"
									:key="index" :label="content" :value="index" />
							</el-select>
						</div>
					</div>
					<div class="subscribe-btn">
						<el-text>赛事:{{index+1}}</el-text>
						<el-button type="danger" :icon="Delete" @click="doSubscribe(index)"></el-button>
					</div>
				</div>
			</div>
		</div>
		<template #footer>
			<div class="dialog-footer">
				<el-button @click="emit('update',{type: 0,reload: false})">取消</el-button>
				<el-button type="primary" @click="doSubmit">
					确认
				</el-button>
			</div>
		</template>

	</el-dialog>


</template>

<script setup>
	import { nextTick, reactive, ref } from 'vue';
	import { Plus, Minus, Delete } from '@element-plus/icons-vue'
	import UploadProps from 'element-plus'
	import { ElMessage } from 'element-plus'
	import { add as addLightningSecret, update as updateLightningSecret,
		getMatchListByGroup } from "@/api/business/lightningSecret";
	import useConvertHitResult from "@/hooks/useConvertHitResult"
	import { uploadImage } from '@/api/common';
	import { format, isToday, isBefore, isAfter, startOfToday } from 'date-fns';
	const BASE_API = import.meta.env.VITE_APP_BASE_API;
	const props = defineProps(['isOpen', 'title', 'form'])
	const emit = defineEmits(['update'])
	const data = reactive({
		openAddDialog: props.openAddDialog,
		formLabelWidth: '140px',
		hitList: [{
				value: 0,
				label: '未命中',
			},
			{
				value: 1,
				label: '命中',
			},
		],
		status: [{
				value: 0,
				label: '未完场',
			},
			{
				value: 1,
				label: '已完场',
			},
		]
	})
	const { form } = props;
	onMounted(() => {
		//获取赛事详情
		if (form.id != null) {
			doGetDetailList();
		}
	})

	//查询赛事列表集合
	const doGetDetailList = () => {
		getMatchListByGroup(form.id).then(resp => {
			form.matchList = resp.data;

			for (var i = 0; i < form.matchList.length; i++) {
				let item = form.matchList[i]
				if (item.recommendContent == null) {
					item.recommendContent = '';
				}
			}
		})
	}

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


	//添加
	const doSubmit = () => {

		// if (form.rateOfReturn == null || form.rateOfReturn == '') {
		// 	ElMessage.error("请填写回报率");
		// 	return;
		// }

		// if (form.matchList.length <= 0) {
		// 	ElMessage.error("请选择赛事!");
		// 	return;
		// }

		if (form.matchDate == null || form.matchDate == '') {
			ElMessage.error("请选择秘籍日期");
			return;
		}
		for (var i = 0; i < form.matchList.length; i++) {
			let match = form.matchList[i]
			if (match.leagueName == null || match.leagueName == '') {
				ElMessage.error("请填写第" + (i + 1) + "场赛事的联赛名");
				return;
			}


			if (match.matchTime == null) {
				ElMessage.error("请填写第" + (i + 1) + "场赛事的比赛时间");
				return;
			}

			if (match.homeName == null || match.homeName == '') {
				ElMessage.error("请填写第" + (i + 1) + "场赛事的主队名称");
				return;
			}

			if (match.guestName == null || match.guestName == '') {
				ElMessage.error("请填写第" + (i + 1) + "场赛事的客队名称");
				return;
			}

		}


		let params = form;
		if (form.id == null) {
			//添加
			addLightningSecret(params).then(resp => {
				ElMessage.success("添加成功!");
				emit('update', { type: 0, reload: true })
			})
		} else {
			updateLightningSecret(params).then(resp => {
				ElMessage.success("修改成功!");
				emit('update', { type: 1, reload: true })
			})
		}
	}

	const doAddMatch = async () => {
		form.matchList.push({
			isHit: 0,
			matchStatus: 0,
			groupId: form.id
		})
		await nextTick();
		let scroll = document.querySelector(".content");
		scroll.scrollTop = scroll.scrollHeight;
	}

	const doSubscribe = (index) => {
		form.matchList.splice(index, 1);
	}
</script>

<style lang="scss">
	.file-uploader {
		width: 178px;
		height: 178px;
		border: 1px red solid;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px dashed var(--el-border-color);

		.file-uploader-icon {
			width: 178px;
			height: 178px;
		}

		.pay-code {
			width: 178px;
			height: 178px;
		}
	}

	.el-dialog.secret-add {
		margin-top: 0 !important;
		/* 移除默认的margin */
		transform: translateY(-50%);
		/* 向上移动50% */
		top: 50%;
		height: 90%;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
		width: 60% !important;

		.el-dialog__body {
			display: flex;
			flex-grow: 1;
			overflow: hidden !important;
			overflow-y: auto;
			flex-direction: column;
			position: relative;

			.el-form {
				display: inline-block;

				.el-form-item {
					align-items: center;
				}
			}

			.match-body {
				height: 0px;
				flex-grow: 1;
				display: flex !important;
				border: 1px #bfcbd9 solid;
				border-radius: 4px;
				flex-direction: column;
				align-items: center;

				.add {
					margin-top: 24px;
					height: 32px;
				}

				.content {
					height: 0;
					display: flex;
					flex-direction: column;
					flex-grow: 1;
					width: 100%;
					position: relative;
					overflow: hidden;
					overflow-y: auto;

					.detail-row {
						margin: 10px;
						height: 200px;
						border: 1px #bfcbd9 solid;
						border-radius: 4px;
						display: flex;

						.row-content {
							width: 85%;
							display: flex;
							flex-wrap: wrap;
							overflow: hidden;
							overflow-y: auto;
							justify-content: start;

							.row-item {
								padding: 5px;
								flex: 0 0 33%;
								display: flex;
								align-items: center;

								:global(.el-input) {
									width: 100% !important;
								}
							}

							.item-recommend {
								flex: 0 0 50%;
							}
						}

						.subscribe-btn {
							flex-grow: 1;
							display: flex;
							justify-content: center;
							align-items: center;
						}

					}
				}
			}

		}
	}
</style>