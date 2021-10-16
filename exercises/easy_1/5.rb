ENCRYPTED_NAMES = <<~ENC
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
ENC

def decrypt_string_13(string)
  string.chars.map do |char|
    decrypt_char_13(char)
  end.join('')
end

def decrypt_char_13(char)
  return char unless letter?(char)

  ord = char.ord
  new_ord = ord - 13

  if uppercase?(ord)
    new_ord += 26 if new_ord < 65
  else
    new_ord += 26 if new_ord < 97
  end

  new_ord.chr
end

def uppercase?(ordinance)
  (65..90).cover?(ordinance)
end

def letter?(char)
  char.match?(/[A-Za-z]/)
end

puts decrypt_string_13(ENCRYPTED_NAMES)