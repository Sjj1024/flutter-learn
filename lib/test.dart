void run() {
  var list1 = ["a", "b", "c", 1, 2, 3];
  // 数组的长度
  var len = list1.length;
  print("数组的长度是: $len");
  // 将数组里面的元素翻转
  var list2 = list1.reversed;
  print("翻转后的数组是: $list2");
  // 数组里面添加元素
  list1.add("孙悟空");
  list1.insert(6, "武松");
  print("list1添加元素后: $list1");
  // 是否为空
  if (list1.isEmpty) {
    print("数组为空");
  } else {
    print("数组不为空");
  }
  // 判断是否不为空
  if (list1.isNotEmpty) {
    print("数组不为空");
  } else {
    print("数组为空");
  }
  // 获取第一个元素
  var first = list1.first;
  print("第一个元素是: $first");
  // 添加一个新数组进去
  var newList = [7, 9];
  list1.addAll(newList);
  print("添加新数组后的list1: $list1");
  // 在指定索引前添加元素
  list1.insert(0, "第一个元素");
  print("添加后的元素是:$list1");
  // 从列表中删除指定元素
  list1.remove("孙悟空");
  print("删除后的数组内容是:$list1");
  // 删除指定位置的元素
  list1.removeAt(0);
  print("删除第一个元素后的数组内容是:$list1");
  // 查找某个元素的位置
  var index = list1.indexOf("武松");
  print("武松的位置是:$index");
  // 数组拼接成字符串
  var joinStr = list1.join("||");
  print("拼接后的字符串是： $joinStr");
  // 判断数组中是否包含某个元素
  if (list1.contains("武松")) {
    print("包含武松");
  } else {
    print("不包含武松");
  }
  // forEach遍历数组
  list1.forEach((element) {
    print("数组中的元素是: $element");
  });
  // map遍历数组并返回新数组
  list1.remove(7);
  list1.remove(9);
  var list3 = list1.map((item) {
    return "hello $item";
  });
  print("map遍历后的数组是: $list3");
  // 对数组进行排序
  var list4 = [9, 2, 5, 8, 1, 3, 2];
  list4.sort((a, b) => a - b);
  print("排序后的数组是: $list4");
  // 数组去重
  var set1 = Set();
  set1.addAll(list4);
  var list5 = set1.toList();
  print("去重后的数组是: $list5");
  // reduce和fold类似，不过fold可以提供一个初始值，这一点和js很像
  var sum1 = list4.reduce((pre, cur) {
    print("pre, cur 的值是: $pre, $cur");
    return pre + cur;
  });
  print("得到总的初始值是: $sum1");
  // every判断每一项是否达到了条件: item必须加括号
  var flg = list4.every((item) => item > 5);
  print("判断是否都满足: $flg");
  // where是返回数组中给定条件的集合
  var targetList = list4.where((element) => element > 5);
  print("得到的目标数组是: $targetList");
  // 获取当前变量的数据类型
  print("数据类型是: ${targetList.runtimeType}");
  print("元素的数据类型: ${list4.runtimeType}");
  // 判断类型:
  if (targetList is List) {
    print("targetList是数组");
  } else {
    print("targetList不是数组");
  }
  // 下面两种类型判断都可以，一种是等号，一种是is判断
  // if (list4.runtimeType == List<int>) {
  if (list4.runtimeType is List<int>) {
    print("list4.runtimeType 和 List相等");
  } else {
    print("list4.runtimeType 和 List不相等");
  }
}

void main() {
  try {
    run();
  } catch (e) {
    print("有错误了");
  }
}
