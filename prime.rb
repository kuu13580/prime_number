#素数の羅列表示
def allprime (max)
    #変数初期化
    prime_number = [2]
    number = 3
    ins = 0
    #繰り返し処理
    (max - 2).times do
        answer = "true"
        insmax = (number ** (1/2.0)).ceil #平方根計算
        prime_number.each do |i|
            ins = number % i
            if ins == 0 #割り切れるか判断
                answer = "false"
                break
            elsif i > insmax
                break
            end
        end

        if answer == "true"
            prime_number.push(number)
        end
        number += 1
    end
    prime_number
end
#因数分解
def factorization (number)
    factorizated_hash = {}
    insmax = (number ** (1/2.0)).ceil
    prime_number_array = allprime (insmax)
    prime_number_array.each do |i|
        if number % i == 0
            index = 0
            while number % i == 0 do
            number /= i
                index += 1
            end
            factorizated_hash.store(i.to_s, index)
        end
        break if number == 1
    end
    if number != 1
        factorizated_hash.store(number.to_s, 1)
    end
    factorizated_hash
end

#mainプログラム
print ("どのツールを使用しますか？\nすべての素数を表示　-> 1\n素因数分解　-> 2\n")
tools = gets.to_i
print ("\n")
case tools
when 1
    print ("どこまでの素数を表示しますか？")
    input = gets.to_i
    output = allprime(input)
    p output
    puts ("計：" + output.size.to_s)
    puts ("処理完了")
when 2
    print ("素因数分解する数字：")
    input = gets.to_i
    output = factorization (input)
    output.each do |key, value|
        puts ("%d^%d" % [key.to_i, value.to_i])
    end
    puts ()
    puts ("処理完了")
end
