module OrdersHelper
  def order_step_class(step)
    classes = {
        '2' => '',
        '3' => '',
        '4' => '',
        '5' => '',
        '6' => ''
    }

    classes['2'] = (step == 'two') ? 'active' : ''
    classes['3'] = (step == 'three') ? 'active' : ''
    classes['4'] = (step == 'four') ? 'active' : ''
    classes['5'] = (step == 'five') ? 'active' : ''
    classes['6'] = (step == 'six') ? 'active' : ''

    classes
  end
end
