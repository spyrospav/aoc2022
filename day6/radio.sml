local

  fun parse filename = 
    let
      val inStream = TextIO.openIn filename

    in
      case TextIO.inputLine inStream of
        NONE => raise Fail "Empty file"
        | SOME line => (TextIO.closeIn inStream; line)
    end;


  fun duplicated [] = false
    | duplicated (x::xs) = (List.exists (fn y => x = y) xs) orelse (duplicated xs);

  fun solve l r = 
    if duplicated l then 1 + solve (List.drop(l, 1) @ [hd r]) (tl r)
    else 0
  
in

  fun main filename n =
    let 
      val line = explode(parse filename)
      val c = List.take(line, n)
      val r = List.drop(line, n)
    in
      n + (solve c r)
    end

end
