import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  String player1= "Player 1",player2 = "Player 2";
  Color myColor1 = Colors.redAccent,myColor2 = Colors.redAccent,myColor3 = Colors.redAccent,myColor4 = Colors.redAccent,myColor5 = Colors.redAccent,myColor6 = Colors.redAccent,myColor7 = Colors.redAccent,myColor8 = Colors.redAccent,myColor9 = Colors.redAccent;
  String msg = "";
  String sign1 = "",sign2 = "",sign3 = "",sign4 = "",sign5 = "",sign6 = "",sign7 = "",sign8 = "",sign9 = "";
  bool isPlayer1 = true ;
  var gameBoard  = [[0,0,0],[0,0,0],[0,0,0]];
  var win1 = 0,win2 = 0,win3 = 0;
  int p1=0, p2=0;
  @override
  Widget build(BuildContext context) {

    void updatePlayerName(){
      final formKey = GlobalKey<FormState>();
      TextEditingController player1TextEditingController = new TextEditingController();
      TextEditingController player2TextEditingController = new TextEditingController();
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          color: Colors.teal,
          padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 25.0),
          child: Scaffold(
            backgroundColor: Colors.teal,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {return val.isEmpty?"Naam Batao":null; },
                      controller: player1TextEditingController,
                      decoration: InputDecoration(
                        hintText: "Player 1 Name",
                        hintStyle: TextStyle(
                          color: Colors.amberAccent,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      validator: (val) {return val.isEmpty?"Naam Batao":null; },
                      controller: player2TextEditingController,
                      decoration: InputDecoration(
                        hintText: "Player 2 Name",
                        hintStyle: TextStyle(
                          color: Colors.amberAccent,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      color: Colors.blueAccent,
                      child: Text("Submit"),
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          setState(() {
                            p1 =0;p2=0;
                            sign1 = "";sign2 = "";sign3 = "";sign4 = "";sign5 = "";sign6 = "";sign7 = "";sign8 = "";sign9 = "";
                            myColor1 = Colors.redAccent;myColor2 = Colors.redAccent;myColor3 = Colors.redAccent;myColor4 = Colors.redAccent;myColor5 = Colors.redAccent;myColor6 = Colors.redAccent;myColor7 = Colors.redAccent;myColor8 = Colors.redAccent;myColor9 = Colors.redAccent;
                            msg = "";
                            isPlayer1 = true ;
                            gameBoard  = [[0,0,0],[0,0,0],[0,0,0]];
                            win1 = 0;win2 = 0;win3 = 0;
                            player1 = player1TextEditingController.text;
                            player2 = player2TextEditingController.text;
                          });
                        Navigator.pop(context);}
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            "Tic-Tak-Toe",
            style: TextStyle(
              fontFamily: "KronaOne-Regular",
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body:Container(
        color: Colors.teal,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width:145.0,height:50.0 ,child: RaisedButton(color: Colors.amber,child :Text("$player1' Score: $p1",style: TextStyle(fontSize: 12.0)),textColor: Colors.pinkAccent,onPressed: (){},),),
                    SizedBox(width: 10.0,),
                    SizedBox(width:145.0,height:50.0 ,child: RaisedButton(color: Colors.amber,child :Text("$player2' Score: $p2",style: TextStyle(fontSize: 12.0)),textColor: Colors.blueAccent,onPressed: (){},),),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor1,child: Text("$sign1",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[0][0]==0){
                      if(isPlayer1){gameBoard[0][0] = 1;setState(() {
                        sign1 = "X";
                        myColor1 = Colors.pinkAccent;
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[0][0] = 2;setState(() {
                        myColor1 = Colors.blueAccent;
                        sign1 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor2,child: Text("$sign2",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[0][1]==0){
                      if(isPlayer1){gameBoard[0][1] = 1;setState(() {
                        myColor2 = Colors.pinkAccent;
                        sign2 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[0][1] = 2;setState(() {
                        myColor2 = Colors.blueAccent;
                        sign2 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor3,child: Text("$sign3",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[0][2]==0){
                      if(isPlayer1){gameBoard[0][2] = 1;setState(() {
                        myColor3 = Colors.pinkAccent;
                        sign3 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[0][2] = 2;setState(() {
                        myColor3 = Colors.blueAccent;
                        sign3 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                  ],
                ),
                SizedBox(height: 3.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor4,child: Text("$sign4",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[1][0]==0){
                      if(isPlayer1){gameBoard[1][0] = 1;setState(() {
                        myColor4 = Colors.pinkAccent;
                        sign4 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[1][0] = 2;setState(() {
                        myColor4 = Colors.blueAccent;
                        sign4 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor5,child: Text("$sign5",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[1][1]==0){
                      if(isPlayer1){gameBoard[1][1] = 1;setState(() {
                        myColor5 = Colors.pinkAccent;
                        sign5 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[1][1] = 2;setState(() {
                        myColor5 = Colors.blueAccent;
                        sign5 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor6,child: Text("$sign6",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[1][2]==0){
                      if(isPlayer1){gameBoard[1][2] = 1;setState(() {
                        myColor6 = Colors.pinkAccent;
                        sign6 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[1][2] = 2;setState(() {
                        myColor6 = Colors.blueAccent;
                        sign6 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }else { return null;}}),
                    ),
                  ],
                ),
                SizedBox(height: 3.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor7,child: Text("$sign7",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[2][0]==0){
                      if(isPlayer1){gameBoard[2][0] = 1;setState(() {
                        myColor7 = Colors.pinkAccent;
                        sign7 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[2][0] = 2;setState(() {
                        myColor7 = Colors.blueAccent;
                        sign7 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor8,child: Text("$sign8",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[2][1]==0){
                      if(isPlayer1){gameBoard[2][1] = 1;setState(() {
                        myColor8 = Colors.pinkAccent;
                        sign8 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[2][1] = 2;setState(() {
                        myColor8 = Colors.blueAccent;
                        sign8 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                    SizedBox(width: 3.0),
                    SizedBox(width: 100.0,height: 100.0,child: RaisedButton(color: myColor9,child: Text("$sign9",style: TextStyle(fontSize: 50.0),),padding: EdgeInsets.all(10),onPressed: (){if(gameBoard[2][2]==0){
                      if(isPlayer1){gameBoard[2][2] = 1;setState(() {
                        myColor9 = Colors.pinkAccent;
                        sign9 = "X";
                      });win1 = horitest(1, gameBoard);win2 = vertitest(1, gameBoard);win3 = diagonaltest(1, gameBoard); if((win1 == 1)||(win2 == 1)||(win3 == 1)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 1 win the game";
                        p1++;
                      });}isPlayer1 = !isPlayer1;}
                      else{gameBoard[2][2] = 2;setState(() {
                        myColor9 = Colors.blueAccent;
                        sign9 = "O";
                      });win1 = horitest(2, gameBoard);win2 = vertitest(2, gameBoard);win3 = diagonaltest(2, gameBoard); if((win1 == 2)||(win2 == 2)||(win3 == 2)){gameBoard =  [[3,3,3],[3,3,3],[3,3,3]];setState(() {
                        msg = "Player 2 win the game";
                        p2++;
                      });}isPlayer1 = !isPlayer1;}
                    }}),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("$msg",style: TextStyle(color: Colors.amberAccent,fontFamily: "KronaOne-Regular",fontWeight: FontWeight.bold),),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(color : Colors.amber,child : Text("New Game",),onPressed: (){
                      return updatePlayerName();
                    },),
                    SizedBox(width: 15.0),
                    FlatButton(color : Colors.amber,child : Text("Next Match",),onPressed: (){
                      setState(() {
                        sign1 = "";sign2 = "";sign3 = "";sign4 = "";sign5 = "";sign6 = "";sign7 = "";sign8 = "";sign9 = "";
                        myColor1 = Colors.redAccent;myColor2 = Colors.redAccent;myColor3 = Colors.redAccent;myColor4 = Colors.redAccent;myColor5 = Colors.redAccent;myColor6 = Colors.redAccent;myColor7 = Colors.redAccent;myColor8 = Colors.redAccent;myColor9 = Colors.redAccent;
                        msg = "";
                        isPlayer1 = true ;
                        gameBoard  = [[0,0,0],[0,0,0],[0,0,0]];
                        win1 = 0;win2 = 0;win3 = 0;
                      },);
                    },)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int horitest(a,gameBoard)
{var flag = 0;
for(var i = 0 ; i<3 ; i++)
{
  if(flag == a)
  {return a;}
  else
  {
    for(var j = 0; j<3 ; j++)
    {
      if(gameBoard[i][j] == a)
        flag = a;
      else
        flag = 0;
      if(flag == 0)
        break;
    }
  }
}        return flag;
}
int vertitest(x,gameBoard)
{
  var flag = 0;
  for(var i=0;i<3;i++)
  {
    if(flag == x)
    {
      return x;
    }
    else
    {
      for(var j=0;j<3;j++)
      {
        if(gameBoard[j][i] == x)
          flag=x;
        else
          flag=0;
        if(flag == 0)
          break;
      }
    }
  }    return flag;
}
int diagonaltest(x,gameBoard)
{
  if((gameBoard[0][0]==x)&&(gameBoard[1][1]==x)&&(gameBoard[2][2]==x))
  {
    return x;
  }
  if((gameBoard[0][2]==x)&&(gameBoard[1][1]==x)&&(gameBoard[2][0]==x))
  {
    return x;
  }
}


