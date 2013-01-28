input = "But I must 1 explain to you 3444 how all http://www.ukr.net/news/politika.html this
mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete
account of the system, and expound the actual teachings of the great 444 explorer of the truth, the
master-builder of 11134 human happiness. No one rejects, dislikes, or avoids pleasure itself,
because it is pleasure, but because those who do not know 0 how to pursue 334 pleasure rationally
encounter consequences that are 111 extremely painful. Nor again 2 is there anyone who loves or
pursues or desires to obtain pain of itself, because it is pain, but because occasionally
circumstances occur in which 3444 toil and pain can procure him some great 234234 234 pleasure.
http://www.teletrade.com.ua/novice/promo?utm_source=ukr&utm_medium=kak&utm_campaign=silki to take a
trivial example, which of us ever undertakes laborious physical exercise,
http://orakul.com/horoscope/astro/general/today/lion.html except to obtain 11 some advantage from
it? But who has any right to find fault with a man who chooses to enjoy a pleasure 312 that has 777
no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"


class StringUtils 

	attr_reader :input

	def initialize(input)
		@input = input
	end

	def longest_word
		words.sort_by(&:length).last
	end

	def longest_digit_count
		input.scan(/\d+/).sort_by(&:length).last.length
	end

	def root_urls
		input.scan(/http:\/\/[^\/]*/)
	end

	def words_table
		words_table = Hash.new(0)
		words.each do |word| words_table[word.downcase] += 1; end
		return words_table.sort_by{|key, value| value}.reverse
	end

	def words
		input.gsub(/http[^\s]*/, '').scan(/[a-zA-Z]+/)
	end

end

#========================================

task2 = StringUtils.new(input)

puts "Longest word is: #{task2.longest_word}"
puts "Longest digit count: #{task2.longest_digit_count}"
puts "Root urls: #{task2.root_urls}"
task2.words_table.each do |word| puts "#{word}"; end
