####### Week3 code #######

#### current status for loop #####
# define status
status = c(”sleep”, “awake”)
mental_status = c(“good”, ”tired”)

# define your current status
You <- status[2]
mental <- mental_status[2]

# for loop 
If ( You == status[2] ){
  if( mental == mental_status[2]){
      print(“You need coffee”)
  } else {
      print(“FoCuS on your lab”)
  }
}


##### decision helper bot ######
# we are creating a bot to help our decision making process
# Answer to these specific conditions
#  1. “I'm hungry”
#  2. “Maybe some boba”
#  3. “some desserts”


# Data collection
You <- c(“I'm hungry” , “Maybe some boba” , “I don’t know”, “some desserts”, “some desserts”, ”I'm hungry”, “stop asking me”, “Maybe some boba”, “I need coffee”)


# for loop
for (i in 1:length(You)){
  If ( You[i] == “I'm hungry”){
     print(“how about chipotle?”)
     } else if (You[i]== “Maybe some boba"){
     print(“go to bubble tea place”)
     } else if (You[i]== “some desserts”) {
     print(“Mille-Feuille Bakery”)
     } else {
     print(“think more and come back”)
     }
  } 
}

