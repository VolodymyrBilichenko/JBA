<?php echo $header; ?>
<main id="main">
  <section class="catalog-page">
    <div class="container">
      <ul class="product-menu">
        <li>
          <a href="#" class="swipe-menu sidebar-opener">
            <i class="icon-arrow_back"></i>
            <strong><?php echo $text_filter;?></strong>
          </a>
        </li>
        <li>
          <a class="cart-link" href="/cart/">
            <strong><?php echo $text_cart?></strong>
            <i class="icon-shoping-cart"><span><?php echo $total_card?></span></i></a>
        </li>
      </ul>
      <div class="main-row">
        <aside class="sidebar-left">
          <a href="#" class="swipe-menu sidebar-opener">
            <i class="icon-arrow_back"></i>
          </a>
          <a href="#" class="swipe-menu main-nav-opener">
            <i class="icon-arrow_back"></i>
            <strong><?php echo $text_main_menu?></strong>
          </a>
          <?php echo $column_left?>
        </aside>
        <div class="main-col-7">
          <div class="info-text">
            <h1>
              <?php echo $heading_title; ?>
            </h1>
            <?php echo $description; ?>
          </div>
          <div class="product-holder">
            <?php $prodIdsList = []?>
            <?php foreach($products as $product): ?>
            <?php $prodIdsList[] = $product['product_id']?>
            <div class="product-box">
              <div class="product <?php echo ($product['discount']) ? 'sale':''?>">
                <?php if($product['discount']): ?>
                <div class="product__discount">
                  <strong>
                    -<?php echo $product['discount']?>%
                  </strong>
                </div>
                <?php endif; ?>
                <a href="<?php echo $product['href']?>" class="product__img">
                  <img src="<?php echo $product['thumb']?>" alt="<?php echo $product['name']?> - <?php echo $text_img;?>" title="<?php echo $product['name']?>">
                </a>
                <?php if($product['cat_name']): ?>
                <a href="<?php echo $product['cat_href']?>" class="product__type">
                  <?php echo $product['cat_name']; ?>
                </a>
                <?php endif; ?>
                <a href="<?php echo $product['href']?>" class="product__name">
                  <?php echo $product['name']?>
                </a>
                <div class="d-flex">
                  <div class="column column-1">
                    <div class="product__price">
                      <span class="<?=($product['special']) ? 'product__price--sale' : '' ?>"><?php echo $product['price']?> &#8372;</span>
                      <?php if($product['special']): ?>
                      <?php echo $product['special']?> &#8372;
                      <?php endif; ?>
                    </div>
                    <span class="stock">
                      <?php if($product['quantity']): ?>
                      <?php echo $text_are_available?>
                      <?php else:?>
                      <?php echo $text_are_no_available;?>
                      <?php endif; ?>
                      </span>
                  </div>
                  <div class="column column-2">
                    <a href="#" class="btn-gray"><?php echo $text_add_cart;?></a>
                    <a href="#" class="btn-fast-order js_fast_order" data-pid="<?php echo $product['product_id']; ?>" data-type="modal-fast"><?php echo $text_one_click;?></a>
                    <a href="#" class="fast-order js_fast_order" data-pid="<?php echo $product['product_id']; ?>" data-type="modal-fast"><?php echo $text_one_click;?></a>
                  </div>
                </div>
                <div class="product__more">
                  <?php echo $product['short_description'];?>
                  <?php if($product['quantity']): ?>
                  onclick="cart.add('<?php echo $product['product_id']; ?>',
                  '<?php echo $product['minimum']; ?>');">
                  <?php else:?>
                  ">
                  <?php endif; ?>
                  <?php echo $text_add_cart;?>
                  </span>
                </div>
              </div>
            </div>
            <?php endforeach; ?>

          </div>
          <div class="load-more-box">
            <a role="button" aria-label="load more" class="load-more"></a>
          </div>
          <?php if($recently_watched): ?>
          <div class="recently-view">
            <div class="h3">
              <?php echo $text_recently_watched; ?>
            </div>
            <div class="recently-holder">
              <?php foreach($recently_watched as $item): ?>
              <div class="recently-box">
                <a href="<?php echo $item['href']?>" class="recently">
                  <div class="recently__img">
                    <img src="<?php echo $item['thumb']?>" alt="<?php echo $item['name']?> - <?php echo $text_img;?>" title="<?php echo $item['name']?>">
                  </div>
                  <p class="recently__type">
                    <?php echo $item['cat_name']?>
                  </p>
                  <div class="recently__name">
                    <?php echo $item['name']?>
                  </div>
                </a>
              </div>
              <?php endforeach; ?>

            </div>
          </div>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </section>
  <?php if($stocks): ?>
  <?php echo $stocks?>
  <?php endif; ?>
</main>
<script>
gtag("event", "view_item_list", {
    "send_to":"AW-427604034",
	"currency": "UAH",
	"items": [
		<?php foreach($products as $product): ?>
			{
				"item_name": "<?=$product['name']?>",
				"id": "<?=$product['product_id']?>",
				"price": <?=(int)str_replace(' ', '', $product['price'])?>,
				"item_category": "<?=$product['cat_name']?>",
				"quantity": 1,
				"google_business_vertical":"retail"
			}, 
		<?php endforeach; ?>
	]
});
</script>
<?=var_dump($test)?>
<?php echo $footer; ?>
