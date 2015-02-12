ActiveAdmin.register_page 'Dashboard' do

  menu false

  content title: proc{ I18n.t('active_admin.dashboard') } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #   end
    # end

    columns do
      column do
        panel 'Recent Orders' do
          table_for Order.where(:order_status => Order::STATUS[:new]).order('id desc').limit(10) do
            column('Order No')   {|order| link_to(order.id, admin_order_path(order.id))}
            column('State')   {|order| status_tag(order.order_status)}
            column('Customer'){|order| link_to(order.user.email, admin_user_path(order.user)) if order.user.present? }
            column('Total')   {|order| to_bdt order.order_total                       }
          end
        end
      end

      column do
        panel 'Recent Customers' do
          table_for User.order('id desc').limit(10).each do |customer|
            column(:email)    {|customer| link_to(customer.email, admin_customer_path(customer)) }
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
