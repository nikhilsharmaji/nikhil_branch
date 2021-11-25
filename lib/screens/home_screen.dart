import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:list/constants/constants_colors.dart';
class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController=new TextEditingController();
   List<Map<String, dynamic>> itemMap=[{"name":"Pull down to track the item", "isdeleted":false},{"name":"Try shaking to undo", "isdeleted":false},{"name":"Try pinching two rows apart", "isdeleted":false},{"name":"pull up to clears", "isdeleted":false} ];

   @override
  void initState() {
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      appBar: AppBar(
        title: Text("TO-DO"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return Dialog(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                       border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)
                                     ),
                                    child: TextField(
                                      onSubmitted: (value){
                                        setState(() {
                                          itemMap.insert(0, {"name":textEditingController.text, "isdeleted":false});
                                        });
                                      },
                                      controller: textEditingController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter to do",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: MaterialButton(
                                      color: Colors.blue,
                                      padding: EdgeInsets.all(8),
                                      onPressed: (){
                                        setState(() {
                                          itemMap.insert(0, {"name":textEditingController.text, "isdeleted":false});
                                          Navigator.pop(context);
                                          textEditingController.clear();
                                        });
                                      },
                                      child: Text("ADD"),
                                    ),
                                  )
                                ],
                              ),
                            )
                          );
                        }
                        );

              },
                  child: Text("Add todo", style: TextStyle(color: Colors.white),))
            ],
          )
        ],
      ),
      body: ReorderableListView(
        dragStartBehavior:DragStartBehavior.start ,
        children: <Widget>[

          for(final itemsMap in itemMap.asMap().entries)
            Dismissible(
              key: UniqueKey(),
              onDismissed: (DismissDirection dismiss){

              setState(() {
                if(dismiss.index==2){
                  itemsMap.value.update("isdeleted", (value) =>true );
                  itemMap.add(itemsMap.value);
                  itemMap.removeAt(itemsMap.key);
                }
                else if(dismiss.index==3){
                  itemMap.removeAt(itemsMap.key);
                }
              });
              },
              child: Card(
                color: itemsMap.value.values.last==true ? CustomColors.black : Colors.deepOrangeAccent,
                key: ValueKey(itemsMap.value),
                elevation: 2,
                child: ListTile(
                  title: Text(itemsMap.value.values.first, style: TextStyle(color: itemsMap.value.values.last==true ? Colors.grey: Colors.black ,decoration: itemsMap.value.values.last==true? TextDecoration.lineThrough : TextDecoration.none),),
                ),
              ),
            ),
        ],
        onReorder: reorderData,

      ),

    );
  }

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =itemMap.removeAt(oldindex);
      itemMap.insert(newindex, items);
    });
  }

    deleteData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =itemMap.removeAt(oldindex);
      itemMap.insert(newindex, items);
    });
  }

  void sorting(){
    setState(() {
      itemMap.sort();
    });
  }
}
