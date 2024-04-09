export function convertDateFormat(dateString) {
    // 将日期字符串转换为 Date 对象
    const date = new Date(dateString);

    // 获取年、月、日、小时、分钟和秒
    const year = date.getFullYear();
    const month = ("0" + (date.getMonth() + 1)).slice(-2); // 月份从 0 开始，需要加 1，同时确保两位数格式
    const day = ("0" + date.getDate()).slice(-2); // 获取日期，确保两位数格式
    const hours = ("0" + date.getHours()).slice(-2); // 获取小时，确保两位数格式
    const minutes = ("0" + date.getMinutes()).slice(-2); // 获取分钟，确保两位数格式
    const seconds = ("0" + date.getSeconds()).slice(-2); // 获取秒钟，确保两位数格式

    // 构建正常的日期格式
    const normalDateFormat = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

    return normalDateFormat;
}

// 示例用法
// const dateString = "2022-04-13T04:00:00.000+00:00";
// const normalDate = convertDateFormat(dateString);
// console.log(normalDate); // 输出: 2022-04-13 04:00:00
