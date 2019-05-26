view: airbnb_dublin {

# If necessary, uncomment the line below to include explore_source.
# include: "flavia_thesis.model.lkml"
    derived_table: {
      explore_source: listings {
        column: Listing_ID {field: listings.id}
        column: host_id {}
        column: neighbourhood {}
        column: room_type {}
        column: price {}
        column: number_of_reviews {}
        column: average_price {}
        column: Sum_reviews {}
        column: sum_price {}
      }
    }
    dimension: id {
      type: number
    }
    dimension: host_id {
      type: number
    }
    dimension: neighbourhood {
      type: string
    }

    dimension: room_type {
      type: string
    }

    dimension: price {
      type: number
    }
    dimension: number_of_reviews {
      type: number
    }
    dimension: average_price {
      type: number
    }
    dimension: Sum_reviews {
      type: number
    }
    dimension: sum_price {
      type: number
    }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: airbnb_dublin {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
