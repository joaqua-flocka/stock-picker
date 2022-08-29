def stock_picker(array)
    #initialize array for possible totals
    possible_totals = Array.new(array.length) {Array.new(array.length,0)}
    #populate possible_totals with sums from buying and selling on each possible day
    possible_totals.each_with_index do |row, r_idx|
        row.each_with_index do |column, c_idx|
            possible_totals[r_idx][c_idx] = array[c_idx] - array[r_idx] if c_idx > r_idx
        end
    end
    #return largest sum in possible_totals
    best_day = [0,0]
    best_sum = 0
    possible_totals.each_with_index do |row,r_idx|
        if row.max > best_sum
            best_sum = row.max
            best_day = [r_idx, row.index(row.max)]
        end
    end
    best_day
end

arr = [17,3,6,9,15,8,6,1,10]

p stock_picker(arr)