
package com.zhidi.common.result;

/**
* @author 作者:ZHP
* createTime 创建时间:2017年10月21日
* 类描述：
* 用于封装项目中的统一json结果
* {
* 	"success":true|false,
*  "error" : -100 到 -999
*  "message" : ""
*  "result" : Object
* }
* @author Lu Jianliang
*/
	public class JsonResult {
		
		/** 用于封装操作结果是否成功 */
		private Boolean success;
		
		/** 用于封装操作失败时的失败编码 */
		private Integer error;
		
		/** 用于封装操作结果消息 */
		private String message;
		
		/** 用于封装操作结果数据 */
		private Object result;
		
		public JsonResult() {
			super();
		}

		public JsonResult(Boolean success, Integer error, String message, Object result) {
			super();
			this.success = success;
			this.error = error;
			this.message = message;
			this.result = result;
		}
		
		/**
		 * 构建成功json结果对象
		 * @param message
		 * @param result
		 * @return
		 */
		public static JsonResult buildSuccessResult(String message,Object result){
			return new JsonResult(true, null, message, result);
		}
		
		/**
		 * 构建成功json结果
		 * @param message
		 * @return
		 */
		public static JsonResult buildSuccessResult(String message){
			return new JsonResult(true, null, message, null);
		}
		
		/**
		 * 构建成功json结果
		 * @return
		 */
		public static JsonResult buildSuccessResult(){
			return new JsonResult(true, null, null, null);
		}
		
		/**
		 * 构建失败json结果
		 * @param error
		 * @param message
		 * @return
		 */
		public static JsonResult buildFailureResult(Integer error,String message){
			return new JsonResult(false, error, message, null);
		}
		
		/**
		 * 构建失败json结果
		 * @param error
		 * @return
		 */
		public static JsonResult buildFailureResult(Integer error){
			return new JsonResult(false, error, null, null);
		}
		
		

		public Boolean getSuccess() {
			return success;
		}

		public void setSuccess(Boolean success) {
			this.success = success;
		}

		public Integer getError() {
			return error;
		}

		public void setError(Integer error) {
			this.error = error;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public Object getResult() {
			return result;
		}

		public void setResult(Object result) {
			this.result = result;
		}
		
}
