$dict = Hash.new
$ret = Hash.new

File.open('./randomlist.txt', 'r') do |f|
	f.each_line do |l|
		$dict[l.chomp] = l
	end
end

def in_dict?(word)
	if $dict.has_key?(word)
		$ret[word] = 1
	end
end

def subVariants(word)
	for i in 0...word.length
		nw = word.dup
		for c in "a".."z"
			nw[i] = c
			in_dict? nw
		end
	end
end

def rmVariants(word)
	for i in 0...word.length
		nw = word.dup
		nw[i] = ""
		in_dict? nw
	end
end

def addVariants(word)
	for i in 0..word.length
		for c in "a".."z"
			nw = word.dup
			if i == word.length
				nw[0] = c + nw[0]
			else
				nw[i] = nw[i] + c
			end
			in_dict? nw
		end
	end
end

def findNetwork(word)
	$ret[word] = word
	
end

