<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="indexListAjax">
	<div class="columns is-multiline">
		<c:forEach var="list" items="${categoryList}" varStatus="status">
			<div class="column is-2" style="text-align: center;">
				<div>
					<button class="button is-large" onclick="inputValue('${list.food_id}');">
						<span class="icon"> <i class="${list.food_class} fa-2x"></i>
						</span>
					</button>
				</div>
				<div>
					<span class="tag is-warning is-small">${list.food_name}</span>
				</div>
			</div>
		</c:forEach>
	</div>
</div>