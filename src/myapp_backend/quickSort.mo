import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";

/**
通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，
然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。
*/
// 快速排序
// 说明
// 1. left 表示数组左边的下标
// 2. right 表示数组右边的下标
func quickSort(array:[var Int], left :Nat, right :Nat):()  {
    if (left < right) {
        var i :Nat = left ;
        var j :Nat = right;
        let temp :Int = array[left] ;

        while (i < j) {
        // 如果 array[j]  >= temp 就是符合条件的
        // 一定要加上 i < j ，不然加减的时候容易溢出
            while (i < j and array[j] >= temp){
              j -=1
              // 前移
            };

            // 否则，将当前值放到前面
            if (i < j) {
              array[i] := array[j];
              i +=1;
            };

            // 如果 array[i] <= temp 就是符合条件的
            while (i < j and array[i] <= temp){
              i +=1
              // 后移
            };
            if (i < j) {
              array[j] := array[i] ;
              j -=1;
            };
        };
        array[i] := temp ;
       
        //为了预防err: Natural subtraction underflow
        if (i<=0){
            quickSort(array, left, 0) ;
        }else{
            quickSort(array, left, i - 1) ;
        };
      
        quickSort(array,i + 1, right);
    };
};

let param : [var Int] = [var 2, 1, 23, 123, 21, 55, -2223, 23];
quickSort(param, 0, param.size()-1);
   
Debug.print("after : ");
Array.map<Int, Text>(Array.freeze(param), func print(x: Int) : Text {
    Debug.print(Int.toText(x));
    return Int.toText(x)
});
