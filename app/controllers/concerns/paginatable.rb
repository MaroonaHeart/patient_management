module Paginatable
  extend ActiveSupport::Concern

  def paginate(scope, per_page: 5, param_page: :page)
    param_value = params[param_page]
    page = if param_value.nil?
              1
            else
              begin
                Integer(param_value)
              rescue ArgumentError, TypeError
                raise ArgumentError, "Invalid page parameter: #{param_value}"
              end
            end

    total_count = scope.count
    total_pages = (total_count.to_f / per_page).ceil
    offset = per_page * (page - 1)

    paginated_scope = scope.limit(per_page).offset(offset)

    return paginated_scope, total_pages, offset
  end
end
