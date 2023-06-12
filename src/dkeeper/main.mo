import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";

actor Dkeeper{

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote( titleText: Text, contentText: Text ){
    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));

  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote( id: Nat ) {
    //take
    let listFront = List.take(notes, id);
    //drop
    let listEnd = List.drop(notes, id + 1);
    //append
    notes := List.append(listFront, listEnd);
  }

};
