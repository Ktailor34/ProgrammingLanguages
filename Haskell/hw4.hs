--Kishan Tailor HW4
--worked with Shivam Patel

main = putStrLn ""
--problem 1
removeAll z lst = [ x | x <- lst, x /=z]

--problem 2
fooNumbers x y z = [ a | a <- [x..y],  a <= z, odd a] ++ [a | a <- [x..y], a > z, even a]

--problem 3
tetHelp 0 = 0
tetHelp 1 = 0
tetHelp 2 = 0
tetHelp 3 = 1
tetHelp 4 = 1
tetHelp a = tetHelp (a-1) + tetHelp (a-2) + tetHelp (a-3) + tetHelp (a-4)

tet 1 = [0,0]
tet 2 = [0,0,0]
tet 3 = [0,0,0,1]
tet x = [tetHelp a | a <- [0..x-1]]

