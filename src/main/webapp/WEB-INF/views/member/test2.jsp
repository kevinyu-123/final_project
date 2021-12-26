<c:forEach var="likes" items='${likes }'>

						<div id="like">
							<!— div시작 …  —>
							<figure class="snip1132">
								<img src="${contextPath}/resources/img/imgMain/sam.png"
									alt="sample22" />
								<figcaption>
									<div class="heading">

										<span>${likes}</span>
										<!— 레스토랑이름 —>

									</div>
									<div class="caption">
										<p>${likes}</p>
										<!—메뉴이름 —>
									</div>
								</figcaption>
								<a href="#"> </a>
								<!— 해당레스토랑페이지 —>
							</figure>
						</div>
					</c:forEach>