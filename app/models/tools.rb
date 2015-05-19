module Tools

	module_function

	def query params

    limit = 100
    start = 0

    limit = params[:limit].to_i if params[:limit] && params[:limit] != ''

    page = 1

    page = params[:page].to_i if params[:page] && params[:page] != ''

    start = (page-1) * limit

		q = ""

    list = []
    order = ""
    params.each_with_index do |(key,val),i|

        new_val = "#{val}"

        if key.to_s.downcase == 'order'

            dir = 'ASC'
            dir = 'DESC' if new_val.to_s.downcase.include?('-')
            order = " ORDER BY #{new_val.gsub('-','')} #{dir}"

        end

      if !['action','controller','format','limit','page','order'].include?(key)

        type = 'AND'
        type = 'OR' if new_val[0] == '|'
        new_val.gsub!('|','')
        opp = '='
        opp = '>' if new_val[0] == '>'
        opp = '<' if new_val[0] == '<'
        new_val.gsub!(/\>|\<|/,'') if opp == '>' || opp == '<'
        if new_val[0] == '*' || new_val[-1] == '*'
          new_val.gsub!('*','%')
          opp = 'LIKE'
        end
        list << " #{type} " if list.count > 0
        ex = "#{key} #{opp} '#{new_val}'"
        ex = "#{key} #{opp} #{new_val}" if opp == '>' || opp == '<'
        list << ex

      end

    end

    q << list.join('')

    # q << order

    # q << " LIMIT #{start},#{limit}"

    q

  end

  def squery params

    limit = 100
    start = 0

    limit = params[:limit].to_i if params[:limit] && params[:limit] != ''

    page = 1

    page = params[:page].to_i if params[:page] && params[:page] != ''

    start = (page-1) * limit

        q = ""

    list = []
    order = ""
    params.each_with_index do |(key,val),i|

        if key.to_s.downcase == 'order'

            dir = 'ASC'
            dir = 'DESC' if val.to_s.downcase.include?('-')
            order = " ORDER BY #{val.gsub('-','')} #{dir}"

        end

      if !['action','controller','format','limit','page','order'].include?(key)

        type = 'AND'
        type = 'OR' if val[0] == '|'
        val.gsub!('|','')
        opp = '='
        if val[0] == '*' || val[-1] == '*'
          val.gsub!('*','%')
          opp = 'LIKE'
        end
        list << " #{type} " if list.count > 0
        list << "users.#{key} #{opp} '#{val}'" if key != 'social'
        list << "socials.profile #{opp} '#{val}'" if key == 'social'

      end

    end

    # ================================================
    # ================================================
    q << " JOIN socials ON users.id = socials.user_id"
    # ================================================
    # ================================================

    q << " WHERE (" if list.count > 0
    q << list.join('')
    q << ")" if list.count > 0
    
    # ================================================
    # ================================================
    q << " GROUP BY users.id"
    # ================================================
    # ================================================

    q << order

    q << " LIMIT #{start},#{limit}"

    q

  end

end