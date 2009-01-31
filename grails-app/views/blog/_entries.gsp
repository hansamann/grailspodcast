                              <g:each in="${entries}" var="entry">

									<div class="entry" id="entry${entry.id}">
										<div class="meta">
											<span class="left">${entry.humanReadableDate}</span>
											${entry.formattedTags}

										</div>
			         					<div class="title">
			         						<%= link(action:'id', id:entry.id ) { entry.title.encodeAsHTML() }%>
		         						</div>
			         					<div class="content">
			         					 	${entry.content}
			         					 	<g:if test="${entry.enclosureURL}">
			         					 		<div class="enclosure"><a href="${entry.enclosureURL}">${entry.enclosureURL}</a></div>
			         					 	</g:if>
			         						<!-- class feedburnerFlareBlock in CSS -->
			         					 	<script src="http://feeds.feedburner.com/~s/grailspodcast?i=http://www.grailspodcast.com/blog/id/${entry.id}" type="text/javascript" charset="utf-8"></script>

			         					</div>
			         					<div class="comments">
			         						${entry.formattedComment} &middot; <a id="createComment${entry.id}">Create comment</a>
			         						<g:each in="${entry.sortedComments}" var="comment">
				         						<div class="comment">
				         							<strong>${comment.formattedCreated}</strong>, ${comment.author.encodeAsHTML()} wrote:<br/>
				         							${comment.content.encodeAsHTML()}
				         						</div>
			         						</g:each>
			         					</div>
			         				</div>

		         				</g:each>

                                <g:if test="${!params.id}">
			         				<div class="pagination">
			         					<g:paginate controller="blog" next="Next Page" prev="Previous Page" action="list" total="${Entry.count()}" />
			         				</div>
		         				</g:if>