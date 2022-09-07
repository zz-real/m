import Array "mo:base/Array"

actor {

  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func qsort(arr : [Int]) : async [Int] {
    //设置为可变数组
    var myArr = Array.thaw<Int>(arr);

    //
    quickSort(myArr, 0, myArr.size() -1);

    // 可变数组转不可变数组;
    return Array.freeze<Int>(myArr);
  };
   

  func quickSort(array:[var Int], left :Nat, right :Nat):() {
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
          quickSort(array,i + 1, right,);
      };
  };
};
