cache←{
 New⇐(<˘∘⍉0⥊˜2⋈˜⊢)
 Set⇐{k‿v𝕊ks‿vs:k⊑∘∊ks?𝕩 ;𝕨(1⊸↓∾˜)¨𝕩}
 Get⇐{k𝕊ks‿vs: (k⊑∘∊ks) ? v⋈k‿v∾´¨i(↑∾(+⟜1)⊸↓)¨𝕩⊣v←vs⊑˜i←⊑k⊐˜ks
                        ; ¯1⋈𝕩 }
}
4‿9 Set 4 1⊸⊑∘Get 1 1⊸⊑∘Get  2 1⊸⊑∘Get (New 3) Set´ ⟨3‿7,2‿5,1‿3⟩
